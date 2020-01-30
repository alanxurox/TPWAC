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
        
        //GIDSignIn.sharedInstance()?.presentingViewController = self
        //GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }
    

    @IBAction func update(_ sender: UIButton) {
        if (status != "Disconnected"){
            if(true==true/*codes to detects if the account is not teacher's*/){
                ref.child("Students").child(userID).setValue([
                "Email": email,
                "User ID": userID,
                "ID Token": idToken,
                "Full Name": fullName,
                "Given Name": givenName,
                "Family Name": familyName,
                "Status": status])
            }else{
                ref.child("Teachers").child(userID).setValue([
                "Email": email,
                "User ID": userID,
                "ID Token": idToken,
                "Full Name": fullName,
                "Given Name": givenName,
                "Family Name": familyName,
                "Status": status])
            }
            
                
                
                /*.setValue([
                "email": email,
                "User ID": userID,
                "ID Token": idToken,
                "Full Name": fullName,
                "Given Name": givenName,
                "Family Name": familyName,
                "Status": status])
 */
            /*ref.child("users").child(userID).setValue(["User ID": userID])
            ref.child("users").child(userID).setValue(["ID Token": idToken])
            ref.child("users").child(userID).setValue(["Full Name": fullName])
            ref.child("users").child(userID).setValue(["Given Name": givenName])
            ref.child("users").child(userID).setValue(["Family Name": familyName])*/
        }
    }
    
    @IBAction func disconnect(_ sender: UIButton) {
        if(true==true/*codes to detects if the account is not teacher's*/){
            ref.child("Students").child(userID).setValue(["User ID": userID])
            
        }else{
            ref.child("Faculties").child(userID).setValue(["User ID": userID])
        }
        GIDSignIn.sharedInstance()?.disconnect()
        GIDSignIn.sharedInstance()?.signOut()
        
        
    }
}

//TEST!
