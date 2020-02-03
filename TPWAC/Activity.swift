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
    var date : Date
    var maxStudent : Int
    var leadFaculty : String
    var currentStudents : [String]
    var headStudent : String
    var altFaculty : String
    
    init(){
        name = "null"
        date = Date()
        maxStudent = 5
        leadFaculty = "vmetcalf@trinitypawling.org"
        currentStudents = ["jwang@trinitypawling.org", "tliu@trinitypawling.org"]
        altFaculty = ""
        headStudent = ""
    }
    
    init(name: String, date: Date, maxStudent: Int, leadFaculty: String, currentStudents: [String], headStudent: String = "", altFaculty: String = ""){
        self.name = name
        self.date = date
        self.maxStudent = maxStudent
        self.leadFaculty = leadFaculty
        self.currentStudents = currentStudents
        self.headStudent = headStudent
        self.altFaculty = altFaculty
    }
    
    public func toDate(year: Int, month: Int, day: Int, hour: Int, minute: Int) -> Date{
        let calendar = Calendar.current

        var components = DateComponents()

        components.year = year
        components.month = month
        components.day = day
        components.hour = hour
        components.minute = minute
        
        return calendar.date(from: components)!
    }
    
    public func getDateString() -> String{
        let dateFormatter = DateFormatter()

        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .full

        return dateFormatter.string(from: date)
    }
    
    public func isActivityAvailable() -> Bool{
        return (maxStudent > currentStudents.count)
    }
    
    
    /**
        Returns 1 if successfully added, 2 if there's no available space, 3 if the student already signed.
    */
    public func addStudent(student: String) -> Int{
        if (isActivityAvailable()){
            if currentStudents.contains(student){
                return 3
            }else{
                currentStudents.append(student)
                return 1
            }
        }else{
            return 2
        }
    }
    
    /**
        Returns true if successfully removed, false if the student is not in the Activity
    */
    public func removeStudent(student: String) -> Bool{
        if currentStudents.contains(student){
            currentStudents.remove(at: currentStudents.firstIndex(of: student)!)
            return true
        }else{
            return false
        }
    }
    
    public func setName(name: String){
        self.name = name
    }
    
    public func getName() -> String{
        return name
    }
    
    public func setDate(date: Date){
        self.date = date
    }
    
    public func setDate(year: Int, month: Int, day: Int, hour: Int, minute: Int){
        self.date = toDate(year: year, month: month, day: day, hour: hour, minute: minute)
    }
    
    public func getDate() -> Date{
        return date
    }
    
    public func setMaxStudent(maxStudent: Int){
        self.maxStudent = maxStudent
    }
    
    public func getMaxStudent() -> Int{
        return maxStudent
    }
    
    public func setLeadFaculty(leadFaculty: String){
        self.leadFaculty = leadFaculty
    }
    
    public func getLeadFaculty() -> String{
        return leadFaculty
    }
    
    public func setCurrentStudents(currentStudents: [String]){
        self.currentStudents = currentStudents
    }
    
    public func getCurrentStudents() -> [String]{
        return currentStudents
    }
    
    public func setHeadStudent(headStudent: String){
        self.headStudent = headStudent
    }
    
    public func getHeadStudent() -> String{
        return headStudent
    }
    
    public func setAltFaculty(altFaculty: String){
        self.altFaculty = altFaculty
    }
    
    public func getAltFaculty() -> String{
        return altFaculty
    }
}
