//
//  createActivities.swift
//  TPWAC
//
//  Created by Tian (Sky) Yu on 1/28/20.
//  Copyright © 2020 Trinity Palwing. All rights reserved.
//

import UIKit

class createActivities: UIView {

    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var date: UITextField! //Why not a DatePicker?
    @IBOutlet weak var place: UITextField!
    @IBOutlet weak var maxStudent: UITextField!
    @IBOutlet weak var headFaculty: UITextField!
    @IBOutlet weak var altFaculty: UITextField!
    
    @IBAction func create(_ sender: UIButton) {
        var newActivity : Activity = Activity()
        newActivity.setName(name: name.text!)
        
        newActivity.setLocation(location: place.text!)
        newActivity.setMaxStudent(maxStudent: Int(maxStudent.text!)!)
        newActivity.setLeadFaculty(leadFaculty: headFaculty.text!)
        newActivity.setAltFaculty(altFaculty: altFaculty.text!)
        //newActivity.setDate(date: <#T##Date#>)
        //date.text = newActivity.getDateString()
        Activity.activityList.append(newActivity)
    }
  
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
