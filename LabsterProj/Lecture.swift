//
//  Lecture.swift
//  UniversityLabster
//
//  Created by Radu Albastroiu on 09/12/2017.
//  Copyright © 2017 Radu Albastroiu. All rights reserved.
//

import Foundation

// time constraint
enum Week: Int {
    case monday = 1
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
}

struct TimeAndDate {
    let timeStart: Int
    let duration: Int
    let date: Week
}


/// Simple note implementation, can be extended
struct Note {
    var title: String
    var content: String
}

protocol Attendable {
    var studentAttendees: StudentCollection { get set }
    
    func checkIn(student: Student)
    func isCheckedIn(student: Student) -> Bool
}

protocol Notable {
    var noteCollection: [Note] { get set }
    
    func addNote(newNote: Note)
}

protocol Approvable {
    var studentConfirmedCollection: StudentCollection { get set }
    
    func confirmLecture(student: Student)
    func hasConfirmed(student: Student) -> Bool
    func isApproved() -> Bool
    func resetApprovable()
}

/// Big fat implementation
class Lecture: Attendable, Notable, Approvable {
    
    var timeAndDate: TimeAndDate
    
    // new lecture
    init(day: Week, timeStart: Int, duration: Int) {
        timeAndDate = TimeAndDate(timeStart: timeStart, duration: duration, date: day)
    }
    
    // edit lecture
    func editLecture(day: Week, timeStart: Int, duration: Int) {
        timeAndDate = TimeAndDate(timeStart: timeStart, duration: duration, date: day)
        resetApprovable()
    }
    
    // attendable protocol
    var studentAttendees: StudentCollection = StudentCollection()
    
    func checkIn(student: Student) {
        if isCheckedIn(student: student) == false {
            studentAttendees.studentCollection.append(student)
        }
        else {
            // FIXME: show alert for already checked
        }
    }
    
    // FIXME: optimization on this method, safer code
    func isCheckedIn(student: Student) -> Bool {
        return studentAttendees.containsStudent(targetStudent: student)
    }
    
    
    // notable protocol
    var noteCollection: [Note] = []
    
    func addNote(newNote: Note) {
        noteCollection.append(newNote)
    }
    
    
    // approvable protocol
    var studentConfirmedCollection: StudentCollection = StudentCollection()
    
    func confirmLecture(student: Student) {
        if hasConfirmed(student: student) == false {
            studentConfirmedCollection.studentCollection.append(student)
        } else {
            // FIXME: show alert for multiple confirmation
        }
    }
    
    func hasConfirmed(student: Student) -> Bool {
        return studentConfirmedCollection.containsStudent(targetStudent: student)
    }
    
    func isApproved() -> Bool {
        if studentConfirmedCollection.studentCollection.count >= 5 {
            return true
        } else {
            return false
        }
    }
    
    func resetApprovable() {
        studentConfirmedCollection.studentCollection.removeAll()
    }
}












