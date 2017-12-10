//
//  DataManipulator.swift
//  UniversityLabster
//
//  Created by Radu Albastroiu on 08/12/2017.
//  Copyright © 2017 Radu Albastroiu. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

// static class
class DatabaseInterface {
    
    var isCorrectSignin: Bool
    
    init() {
        isCorrectSignin = false
    }
    
    func setCurrentStudent(student: Student) {
        currentLoggedInStudent = student
    }
    
    /// Sign in Proces
    func signUpStudent(student: Student) {
        // root database
        let databaseRef = Database.database().reference()
        
        // format to write in database
        let studentInfoMap = student.getInformationMap()
        
        databaseRef.child("StudentCollection").childByAutoId().setValue(studentInfoMap)
        
        setCurrentStudent(student: student)
    }
    
    /// Log in Process
    func logInStudent(loginInfo: LoginInformation) -> Bool {
        
        self.isCorrectSignin = false
        let databaseRef = Database.database().reference().child("StudentCollection")
        
        // FIXME: hacked, maybe Dispatch queue asyncronized
        for loginInfoOne in loginInfoCollection {
            if loginInfoOne.email == loginInfo.email &&
                loginInfoOne.password == loginInfo.password {
                self.isCorrectSignin = true
            }
        }
        
        return self.isCorrectSignin == true
    }
    
    /// Get all Students
    func getStudentFromDatabase() -> StudentCollection {
        
        // FIXME: populateCollection
        let studentCollection: [Student] = Array()
        
        let stdCollection: StudentCollection = StudentCollection()
        stdCollection.studentCollection = studentCollection
        return stdCollection
        
    }
}

var databaseInterface = DatabaseInterface()

