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
    @IBOutlet var selection: [UIButton]!
    //handleSelect action that drops the menu down
    @IBAction func handleSelect(_ sender: UIButton) {
            selection.forEach { (button) in
                    UIView.animate(withDuration: 0.3) {
                        button.isHidden = !button.isHidden
                    }
            }
        }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    @IBAction func onClick(_ sender: UIButton) {
    }
    
}
