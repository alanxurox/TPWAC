//
//  CheckInViewController.swift
//  TPWAC
//
//  Created by Ben Yoon on 2/5/20.
//  Copyright © 2020 Trinity Palwing. All rights reserved.
//

import UIKit
//email message import
import MessageUI

class CheckInViewController: UIView, MFMailComposeViewControllerDelegate {
    //onclick method that sends an email to the students in your selected activity
    
    /*override func draw(_ rect: CGRect) {
     
    }*/
    //sends emails to students
    @IBAction func sendEmailStudents(_ sender: Any) {
        let mailComposeViewController = configureMailController()
        if MFMailComposeViewController.canSendMail(){
            //self.present(mailComposeViewController, animated: true, completion: nil)
        } else {
            showMailError()
        }
    }
    //sets the preset data on the email
    func configureMailController() -> MFMailComposeViewController {
        let mailComposerVC = MFMailComposeViewController()
        mailComposerVC.mailComposeDelegate = self
        //data in the email
        mailComposerVC.setToRecipients(["byoon@trinitypawling.org"])
        mailComposerVC.setSubject("Leaving Campus Reminder")
        mailComposerVC.setMessageBody("We are leaving campus in 15 minutes!", isHTML: false)
        
        return mailComposerVC
    }
    //if the email cannot be sent, an error message will pop up
    func showMailError() {
        let sendMailErrorAlert = UIAlertController(title: "Error", message: "Your device could not send email (or you are running on the simulator)", preferredStyle: .alert)
        let dismiss = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        sendMailErrorAlert.addAction(dismiss)
        //self.present(sendMailErrorAlert, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
}


