//
//  ThirdViewController.swift
//  TPWAC
//
//  Created by Ben Yoon on 1/27/20.
//  Copyright © 2020 Trinity Palwing. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase

//Class that handles the teacher view
class ThirdViewController: UIView{
    //outlet collection that holds all of the drop-down buttons
    @IBOutlet weak var helloMessage: UILabel!
    @IBOutlet var selection: [UIButton]!
    //handleSelect action that drops the menu down
    @IBAction func handleSelect(_ sender: UIButton) {
        if(currentUser.isFaculty){
            selection.forEach { (button) in
                    UIView.animate(withDuration: 0.3) {
                        button.isHidden = !button.isHidden
                    }
            }
        }else{
            /*show specific buttons*/
        }
        }
      //d
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        if(currentUser.isFaculty){
        helloMessage.text = "Hello Faculty"
        }else{
            helloMessage.text = "Hello Student"
        }
        // Drawing code
    }
    
    @IBAction func disconnect(_ sender: UIButton) {
        GIDSignIn.sharedInstance()?.disconnect()
        GIDSignIn.sharedInstance()?.signOut()
        currentUser = User()
    }
    
    @IBAction func onClick(_ sender: UIButton) {
    }
    
}
