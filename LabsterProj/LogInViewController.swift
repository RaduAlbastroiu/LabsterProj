//
//  LogInViewController.swift
//  
//
//  Created by Radu Albastroiu on 10/12/2017.
//

import UIKit

class LogInViewController: UIViewController, kk {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func requestLogIn(_ sender: Any) {
        if let email = emailTextField.text,
            let password = passwordTextField.text {
            
            let loginInfo = LoginInformation(email: email, password: password)
            
            databaseInterface.logInStudent(loginInfo: loginInfo)
            
        } else {
            // FIXME: Invalid data
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
