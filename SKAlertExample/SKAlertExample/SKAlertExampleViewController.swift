//
//  SKAlertExampleViewController.swift
//  SKAlertExample
//
//  Created by Srujan k on 08/07/18.
//  Copyright © 2018 Srujan k. All rights reserved.
//


///  OPTIONS:
/*
1.  If you pass title/ subtitle empty to SKAlert fucntion then that field automatically hides.
2. For alerts containig completion handlers. You will have to manaully set 'isTapToDismiss' variable to false, to disable tap anywhere to dismiss feature. */


import UIKit
import SKAlert

class SKAlertExampleViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let alert = SKAlert()
            alert.isTapToDismiss = false
            alert.showAlert("Plain Alert Header.", subTitle: "Plain Alert Sub Title")
            break
        case 1:
            _  = SKAlert().showAlertWithOkAction("Alert Header", subTitle: "Alert Sub Title", okCompletionHandler: {
                print("Ok Pressed")
            })
            break
        case 2:
            _  = SKAlert().showAlertWithTwoButtons("Alert Header With Two Buttons", subTitle: "Alert Sub Title With Two Buttons", okCompletionHandler: {
                print("Ok Pressed")
            }, cancelCompletionHandler: {
                print("Canel Pressed")
            })
            break
        case 3:
            _ = SKAlert().showAlertWithCustomButtons("Alert Header With Two Custom Buttons", subTitle: "Sub title with custom buttons with Handlers........!!!", leftBtnTitle: "Left", leftBtnColor: UIColor.black, rightBtnTitle: "right", rightBtnColor: UIColor.red, leftCompletionHandler: {
                print("left")
            }) {
                print("right")
            }
            break
        case 4:
            _  = SKAlert().showAlert("Plain Alert Header with no subtitle", subTitle: "")
            break
        case 5:
            _  = SKAlert().showAlert("Header, Tap outside alert to dismiss..", subTitle: "")
            break
        default:
            break
        }
    }

}
