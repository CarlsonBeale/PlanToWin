//
//  ViewController.swift
//  Plan to WIn
//
//  Created by Carlson Beale on 1/2/18.
//  Copyright © 2018 StarlightMamba. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
//  view userdefaults
//    override func viewDidAppear(_ animated: Bool) {
//        for (key, value) in UserDefaults.standard.dictionaryRepresentation() {
//            print("\(key) = \(value) \n")
//        }
//    }
    
    @IBOutlet weak var usernameInput: UIStackView!
    @IBOutlet weak var passwordInput: UITextField!
    
    @IBAction func logInButton(_ sender: Any) {
        
    }
    
    @IBAction func Remove(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "LogInInfo")
        userDefaults.removeObject(forKey: "userInfo")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

