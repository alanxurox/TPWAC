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
        
        /* This works. The method to create a new activity with specific parameters
         let activity = Activity()
        activity.setMaxStudent(maxStudent: 13)
        ref.child("Activities").child(activity.getName()).setValue([
            "date": activity.getDateString(),
            "maxStudent": activity.getMaxStudent(),
            "leadFaculty": activity.getLeadFaculty(),
            "currentStudents": activity.getCurrentStudents(),
            "headStudent": activity.getHeadStudent(),
            "altFaculty": activity.getAltFaculty()])
        */
        /* This works. Reading activity data from firebase.
        ref.child("Activities").observeSingleEvent(of: .value) { snapshot in
            print(snapshot.childrenCount) // I got the expected number of items
            for oneAct in snapshot.children.allObjects as! [DataSnapshot] {
                print(oneAct.value ?? 00)
                let activity = Activity()
                activity.setMaxStudent(maxStudent: oneAct.childSnapshot(forPath: "maxStudent").value as! Int)
                print(activity.getMaxStudent())
         }
         }
                */
                
           
        
        
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        
        // Do any additional setup after loading the view.
        
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
    }
    
    @IBAction func disconnect(_ sender: UIButton) {
        GIDSignIn.sharedInstance()?.disconnect()
        GIDSignIn.sharedInstance()?.signOut()
    }
}

//TEST!
