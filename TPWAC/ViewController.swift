//
//  ViewController.swift
//  TPWAC
//
//  Created by Ben Yoon on 1/24/20.
//  Copyright © 2020 Trinity Palwing. All rights reserved.
//

import UIKit
import GoogleSignIn
import Firebase

var ref : DatabaseReference = Database.database().reference()

class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //var activity = Activity()
        //activity.setDate(year: 2020, month: 2, day: 2, hour: 20, minute: 20)
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        
        // Do any additional setup after loading the view.
        if (currentUser.getStatus() == "Active"){
            performSegue(withIdentifier: "toMainScreen", sender: nil)
        }
    }


    @IBAction func update(_ sender: UIButton) {

        var group : String
        
        if (currentUser.isFaculty){
            group = "Faculties"
        }else{
            group = "Students"
        }
        ref.child(group).child(currentUser.getUserID()).setValue([
            "email": currentUser.getEmail(),
            "User ID": currentUser.getUserID(),
            "ID Token": currentUser.getIDToken(),
            "Full Name": currentUser.getFullName(),
            "Given Name": currentUser.getGivenName(),
            "Family Name": currentUser.getFamilyName(),
            "Status": currentUser.getStatus()])
        if (currentUser.getStatus() == "Active"){
            performSegue(withIdentifier: "toMainScreen", sender: nil)
        }else{
            condition.text = "Please log in first"
        }
    }
    
    @IBOutlet weak var condition: UILabel!
    
    /*func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!,
              withError error: Error!) {
      if let error = error {
        if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
          print("The user has not signed in before or they have since signed out.")
        } else {
          print("\(error.localizedDescription)")
        }
        return
      }
        condition.text = "Logged in!"
    }*/
}

//TEST!
