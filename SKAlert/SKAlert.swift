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
    @IBOutlet private weak var subView: UIView!
    
    var strongSelf: SKAlert?
    let SKCornerRadius: CGFloat = 3.0
    var contentView =  UIView()
    let nibname = "SKAlert"
    var OkayButtonTag = 1
    let CancelButtonTag = 2
    var okCompletion: OkCompletionHandler? = nil
    var cancelCompletion: CancelCompletionHandler? =  nil
    public var isTapToDismiss: Bool = true
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: self.nibname, bundle: bundle)
        self.view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        self.view.frame = UIScreen.main.bounds

        let window: UIWindow = UIApplication.shared.keyWindow!
        window.addSubview(view)
        window.bringSubview(toFront: view)
        view.frame = window.bounds
        self.setUpContentView()
        strongSelf = self
        self.setUp()
    }
    // MARK: - Set up
    func setUp() {
    }
    func setUpContentView() {
        strongSelf?.contentView.layer.cornerRadius = 10.0
        strongSelf?.contentView.layer.borderWidth = 2
        self.okButton.layer.cornerRadius = SKCornerRadius
        self.cancelButton.layer.cornerRadius = SKCornerRadius
        self.contentView.layer.masksToBounds = true

    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Alerts
    public func showAlert(_ title: String, subTitle: String){
        if title.count == 0{
            strongSelf?.headerTitle.isHidden = true
        }else{
            strongSelf?.headerTitle.text = title
        }
        if subTitle.count == 0{
            strongSelf?.subTitle.isHidden = true
        }else{
            strongSelf?.subTitle.text = subTitle
        }
        strongSelf?.cancelButton.isHidden = true
        strongSelf?.okButton.addTarget(self, action: #selector(dismissView), for: .touchUpInside)
        okCompletion = nil
        cancelButton = nil
        self.animateToSuperView()
    }
    public func showAlertWithOkAction(_ title: String, subTitle: String, okCompletionHandler: OkCompletionHandler?){
        isTapToDismiss = false
        if title.count == 0{
            strongSelf?.headerTitle.isHidden = true
        }else{
            strongSelf?.headerTitle.text = title
        }
        if subTitle.count == 0{
            strongSelf?.subTitle.isHidden = true
        }else{
            strongSelf?.subTitle.text = subTitle
        }
//        isTapToDismiss = false
        strongSelf?.headerTitle.text = title
        strongSelf?.subTitle.text = subTitle
        strongSelf?.cancelButton.isHidden = true
        strongSelf?.okButton.addTarget(self, action: #selector(buttonActon(_:)), for: .touchUpInside)
        strongSelf?.okButton.tag = 1
        self.okCompletion = okCompletionHandler
        self.animateToSuperView()
    }
    public func showAlertWithTwoButtons(_ title: String, subTitle: String, okCompletionHandler : OkCompletionHandler?, cancelCompletionHandler : CancelCompletionHandler?){
        isTapToDismiss = false
        if title.count == 0{
            strongSelf?.headerTitle.isHidden = true
        }else{
            strongSelf?.headerTitle.text = title
        }
        if subTitle.count == 0{
            strongSelf?.subTitle.isHidden = true
        }else{
            strongSelf?.subTitle.text = subTitle
        }
//        isTapToDismiss = false
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
    public func showAlertWithCustomButtons(_ title: String, subTitle: String, leftBtnTitle: String, leftBtnColor: UIColor, rightBtnTitle: String, rightBtnColor: UIColor,  leftCompletionHandler: CancelCompletionHandler? , rightCompletionHandler: OkCompletionHandler? ){
        isTapToDismiss = false
        if title.count == 0{
            strongSelf?.headerTitle.isHidden = true
        }else{
            strongSelf?.headerTitle.text = title
        }
        if subTitle.count == 0{
            strongSelf?.subTitle.isHidden = true
        }else{
            strongSelf?.subTitle.text = subTitle
        }
//        isTapToDismiss = false
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
        self.subView.transform = CGAffineTransform.identity
        UIView.animate(
            withDuration: 0.15,
            animations: {
            self.subView.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                self.view.alpha = 0
                self.subTitle.alpha = 0.0

        }) { _ in
            self.view.removeFromSuperview()
        }
    }
    fileprivate func animateToSuperView(){
        self.subView.transform = CGAffineTransform(scaleX: 0.2, y: 0.2)
        UIView.animate(withDuration: 0.15, animations: {
            self.subView.transform = CGAffineTransform.identity
        }) { _ in
            UIView.animate(withDuration: 0.1, animations: {
                self.subView.transform = CGAffineTransform(scaleX: 0.85, y: 0.85 )
            }) { _ in
                UIView.animate(withDuration: 0.1, animations: {
                    self.subView.transform = CGAffineTransform.identity
                })
            }
        }
    }
    // MARK: - Touch Delegates
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.view != self.subView{
            if isTapToDismiss{
                strongSelf?.dismissView()
            }
        }
    }
}
