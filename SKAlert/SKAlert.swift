//
//  SKAlert.swift
//  SKAlert
//
//  Created by Srujan k on 04/07/18.
//  Copyright © 2018 Srujan k. All rights reserved.
//

import UIKit

public typealias OkCompletionHandler = () -> Void
public typealias CancelCompletionHandler = () -> Void


public class SKAlert: UIViewController {
    @IBOutlet private weak var headerTitle: UILabel!
    @IBOutlet private weak var subTitle: UILabel!
    @IBOutlet private weak var cancelButton: UIButton!
    @IBOutlet private weak var okButton: UIButton!
    @IBOutlet private weak var mainView: UIView!
    @IBOutlet private weak var subView: UIView!
    
    var strongSelf: SKAlert?
    let SKCornerRadius: CGFloat = 3.0
    var contentView =  UIView()
    let nibname = "SKAlert"
    var OkayButtonTag = 1
    let CancelButtonTag = 2
    var okCompletion: OkCompletionHandler? = nil
    var cancelCompletion: CancelCompletionHandler? =  nil

    public init() {
        super.init(nibName: nil, bundle: nil)
        strongSelf = self
        self.setUp()
    }
    // MARK: - Set up
    func setUp() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.nibname, bundle: bundle)
        self.view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        self.view.frame = UIScreen.main.bounds
    }
    func setUpContentView() {
        strongSelf?.contentView.layer.cornerRadius = 5.0
        strongSelf?.contentView.layer.borderWidth = 2
        self.okButton.layer.cornerRadius = SKCornerRadius
        self.cancelButton.layer.cornerRadius = SKCornerRadius
        self.contentView.layer.masksToBounds = true

    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func showAlert(_ title: String, subTitle: String){
        let window: UIWindow = UIApplication.shared.keyWindow!
        window.addSubview(view)
        window.bringSubview(toFront: view)
        view.frame = window.bounds
        self.setUpContentView()
//        view.addSubview(self.subView)
        strongSelf?.headerTitle.text = title
        strongSelf?.subTitle.text = subTitle
        strongSelf?.cancelButton.isHidden = true
        strongSelf?.okButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        okCompletion = nil
        cancelButton = nil
        self.animateToSuperView()
    }
    public func showAlertWithOkAction(_ title: String, subTitle: String, okCompletionHandler: @escaping OkCompletionHandler){
        let window: UIWindow = UIApplication.shared.keyWindow!
        window.addSubview(view)
        window.bringSubview(toFront: view)
        view.frame = window.bounds
        self.setUpContentView()
        //        view.addSubview(self.subView)
        strongSelf?.headerTitle.text = title
        strongSelf?.subTitle.text = subTitle
        strongSelf?.cancelButton.isHidden = true
        strongSelf?.okButton.addTarget(self, action: #selector(buttonActon(_:)), for: .touchUpInside)
        strongSelf?.okButton.tag = 1
        self.okCompletion = okCompletionHandler
        self.animateToSuperView()
    }
    public func showAlertWithTwoButtons(_ title: String, subTitle: String, okCompletionHandler : @escaping OkCompletionHandler, cancelCompletionHandler : @escaping CancelCompletionHandler){
        let window: UIWindow = UIApplication.shared.keyWindow!
        window.addSubview(view)
        window.bringSubview(toFront: view)
        view.frame = window.bounds
        self.setUpContentView()
        view.addSubview(contentView)
        strongSelf?.headerTitle.text = title
        strongSelf?.subTitle.text = subTitle
        strongSelf?.okButton.addTarget(self, action: #selector(buttonActon(_:)), for: .touchUpInside)
        strongSelf?.okButton.tag = 1
        strongSelf?.cancelButton.tag = 2
        strongSelf?.cancelButton.addTarget(self, action: #selector(buttonActon(_:)), for: .touchUpInside)
        strongSelf?.okCompletion = okCompletionHandler
        strongSelf?.cancelCompletion = cancelCompletionHandler
        self.animateToSuperView()
    }
    public func showAlertWithCustomButtons(_ title: String, subTitle: String, leftBtnTitle: String, leftBtnColor: UIColor, rightBtnTitle: String, rightBtnColor: UIColor,  leftCompletionHandler: @escaping CancelCompletionHandler , _ rightCompletionHandler: @escaping OkCompletionHandler){
        let window: UIWindow = UIApplication.shared.keyWindow!
        window.addSubview(view)
        window.bringSubview(toFront: view)
        view.frame = window.bounds
        self.setUpContentView()
        view.addSubview(contentView)
        strongSelf?.headerTitle.text = title
        strongSelf?.subTitle.text = subTitle
        strongSelf?.cancelButton.setTitle(leftBtnTitle, for: .normal)
        strongSelf?.cancelButton.backgroundColor = leftBtnColor
        strongSelf?.okButton.setTitle(rightBtnTitle, for: .normal)
        strongSelf?.okButton.backgroundColor = rightBtnColor
        
        strongSelf?.okButton.addTarget(self, action: #selector(buttonActon(_:)), for: .touchUpInside)
        strongSelf?.okButton.tag = 1
        strongSelf?.cancelButton.tag = 2
        strongSelf?.cancelButton.addTarget(self, action: #selector(buttonActon(_:)), for: .touchUpInside)
        strongSelf?.okCompletion = rightCompletionHandler
        strongSelf?.cancelCompletion = leftCompletionHandler
        self.animateToSuperView()
    }
    // MARK: - Animate View
    @objc func buttonActon(_ sender: UIButton) {
        switch sender.tag {
        case OkayButtonTag:
            if self.okCompletion != nil{
                self.okCompletion!()
            }
            break
        case CancelButtonTag:
            if self.cancelCompletion != nil{
                self.cancelCompletion!()
            }
            break
        default:
            break
        }
        self.dismissView()
        
    }
    @objc func dismissView() {
        
        UIView.animate(
            withDuration: 0.15,
            animations: {
            self.subView.transform = CGAffineTransform(scaleX: 0.20, y: 0.5)
        }) { _ in
            self.view.removeFromSuperview()
        }
    }
    fileprivate func animateToSuperView(){
        self.subView.transform = CGAffineTransform(scaleX: 0.25, y: 0.25 )
        UIView.animate(withDuration: 0.20, animations: {
            self.subView.transform = CGAffineTransform.identity
            
        })
    }

}
