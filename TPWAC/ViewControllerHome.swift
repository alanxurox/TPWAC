//
//  ViewControllerHome.swift
//  TPWAC
//
//  Created by Ben Yoon on 2/12/20.
//  Copyright © 2020 Trinity Palwing. All rights reserved.
//

import UIKit
//Class that handles the home view for navigation
class ViewControllerHome: UIViewController {
    @IBOutlet weak var helloMessage: UILabel!
    //outlet collection that holds all of the drop-down buttons
    @IBOutlet var selection: [UIButton]!
     //handleSelect action that drops the menu down
    @IBAction func handleSelect(_ sender: UIButton) {
    //if the user is faculty show whole menu
           if(currentUser.isFaculty){
               selection.forEach { (button) in
                button.isHidden = !button.isHidden
                       //UIViewController.animate(withDuration: 0.3) {
                           //button.isHidden = !button.isHidden
                       //}
               }
           //if user is a student show the first three buttons
           }else{
               var i = 0
               selection.forEach { (button) in
                       if(i<3){
                        button.isHidden = !button.isHidden
                           //UIViewController.animate(withDuration: 0.3) {
                               //button.isHidden = !button.isHidden
                           //}
                           print(i)
                       }
                       i+=1;
                   }
               }
           }
    override func viewDidLoad() {
        super.viewDidLoad()
        //print the message depending on type of user
                  if(currentUser.isFaculty){
                      helloMessage.text = "Hello, Teacher! Here are your activities!"
                  }else{
                      helloMessage.text = "Hello, Student! Here are your activities!"
                  }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
