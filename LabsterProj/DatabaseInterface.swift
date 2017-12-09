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
    
    /// Sign in Proces
    static func signUpStudent(student: Student) {
        // root database
        let databaseRef = Database.database().reference()
        
        // format to write in database
        let studentInfoMap = student.getInformationMap()
        
        databaseRef.child("StudentCollection").childByAutoId().setValue(studentInfoMap)
        
        currentLoggedInStudent = student
    }
    
    /// Log in Process
    static func logInStudent(loginInfo: LoginInformation) -> Bool {
        // FiXME: implement log in
        return true
    }
    
    /// Get all Students
    static func getStudentFromDatabase() -> StudentCollection {
        
        // FIXME: populateCollection
        let studentCollection: [Student] = Array()
        
        let stdCollection: StudentCollection = StudentCollection()
        stdCollection.studentCollection = studentCollection
        return stdCollection
        
    }
}



