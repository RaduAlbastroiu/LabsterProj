//
//  TestViewController.swift
//  LabsterProj
//
//  Created by Radu Albastroiu on 10/12/2017.
//  Copyright © 2017 Radu Albastroiu. All rights reserved.
//

import UIKit

class TestViewController: UIViewController {

    @IBOutlet weak var testTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func pushButton(_ sender: Any) {
        if let text = testTextField.text {
            print(text)
        } else {
            print("\n it fucked up")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
