//
//  SignUpViewController.swift
//  LabsterProj
//
//  Created by Radu Albastroiu on 10/12/2017.
//  Copyright © 2017 Radu Albastroiu. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var facultyNameTextField: UITextField!
    @IBOutlet weak var facultyYearOfStudyTextField: UITextField!
    @IBOutlet weak var facultySectionTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func submitSignUpInfo(_ sender: Any) {
        
        if let email: String = emailTextField.text,
            let password: String = passwordTextField.text,
            let firstName: String = firstNameTextField.text,
            let lastName: String = lastNameTextField.text,
            let facultyName: String = facultyNameTextField.text,
            let facultyYearString: String = facultyYearOfStudyTextField.text,
            let facultyYear: Int = Int(facultyYearString),
            let facultySection: String = facultySectionTextField.text {
            
            let aStudent = Student(firstName: firstName, lastName: lastName, yearOfStudy: facultyYear, loginInfo: LoginInformation(email: email, password: password), faculty: FacultyInformation(facultyName: facultyName, facultySection: facultySection))
            
            DatabaseInterface.signUpStudent(student: aStudent)
            
            print("\n Succesfully created new user with email \(email) and \(password)")
            
            // jump to lecture collection view
            self.performSegue(withIdentifier: "SignUpToLectureCollection", sender: self)
            
        } else {
            // FIXME: show allert for invalid data
            print("\n Failed to SignUP")
        }
 
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
