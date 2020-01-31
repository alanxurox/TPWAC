//
//  Activity.swift
//  TPWAC
//
//  Created by Jiayang (James) Wang on 1/30/20.
//  Copyright © 2020 Trinity Palwing. All rights reserved.
//

import Foundation

class Activity{
    
    var name : String
    var date : String //Wait
    var maxStudent : Int
    var leadFaculty : String
    var altFaculty : String
    var currentStudents : [String]
    
    init(){
        name = "null"
        date = "01/01/2020" //Wait
        maxStudent = 5
        leadFaculty = "vmetcalf@trinitypawling.org"
        altFaculty = "vmetcalf@trinitypawling.org"
        currentStudents = ["jwang@trinitypawling.org", "tliu@trinitypawling.org"]
    }
}
