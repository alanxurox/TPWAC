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
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var place: UITextField!
    @IBOutlet weak var maxStudent: UITextField!
    @IBOutlet weak var headFaculty: UITextField!
    @IBOutlet weak var altFaculty: UITextField!
    
    @IBOutlet var textfields: [UITextField]!
    
    @IBAction func create(_ sender: UIButton) {
        
        
        for a in textfields{
            if (a.text! == ""){
                return
            }
        }
        
        let newActivity : Activity = Activity()
        newActivity.setName(name: name.text!)
        
        newActivity.setLocation(location: place.text!)
       
        
        if(Int(maxStudent.text!) != nil){ newActivity.setMaxStudent(maxStudent: Int(maxStudent.text!)!)
        }
        newActivity.setLeadFaculty(leadFaculty: headFaculty.text!)
        newActivity.setAltFaculty(altFaculty: altFaculty.text!)
        newActivity.setDate(date: date.date)
        Activity.activityList.append(newActivity)
                
        ref.child("Activities").child(newActivity.getName()).setValue([
        "date": newActivity.getDateString(),
        "maxStudent": newActivity.getMaxStudent(),
        "leadFaculty": newActivity.getLeadFaculty(),
        "location": newActivity.getLocation(),
        "currentStudents": newActivity.getCurrentStudents(),
        "headStudent": newActivity.getHeadStudent(),
        "altFaculty": newActivity.getAltFaculty()])
        
        for a in textfields{
            a.text = ""
        }
        
        
        
    }
  
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
