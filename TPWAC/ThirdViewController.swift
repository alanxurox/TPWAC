//
//  ThirdViewController.swift
//  TPWAC
//
//  Created by Ben Yoon on 1/27/20.
//  Copyright © 2020 Trinity Palwing. All rights reserved.
//

import UIKit
//Class that handles the teacher view
class ThirdViewController: UIView {
    //outlet collection that holds all of the drop-down buttons
    @IBOutlet weak var helloMessage: UILabel!
    @IBOutlet var selection: [UIButton]!
    //handleSelect action that drops the menu down
    @IBAction func handleSelect(_ sender: UIButton) {
        //if the user is faculty show whole menu
        if(currentUser.isFaculty){
            selection.forEach { (button) in
                    UIView.animate(withDuration: 0.3) {
                        button.isHidden = !button.isHidden
                    }
            }
        //if user is a student show the first three buttons
        }else{
            var i = 0
            selection.forEach { (button) in
                    if(i<3){
                        UIView.animate(withDuration: 0.3) {
                            button.isHidden = !button.isHidden
                        }
                        print(i)
                    }
                    i+=1;
                }
            }
        }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        //print the message "is (blank) depending on type of user
        if(currentUser.isFaculty){
            helloMessage.text = "Hello, Teacher! Here are your activities!"
        }else{
            helloMessage.text = "Hello, Student! Here are your activities!"
        }
        // Drawing code
    }
    
    @IBAction func onClick(_ sender: UIButton) {
    }
    
}
