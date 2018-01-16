//
//  ViewController.swift
//  Plan to WIn
//
//  Created by Carlson Beale on 1/2/18.
//  Copyright © 2018 StarlightMamba. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
  //view userdefaults
    override func viewDidAppear(_ animated: Bool) {
//        for (key, value) in UserDefaults.standard.dictionaryRepresentation() {
//            if key == "logInInfo" || key == "userInfo" {
//                print("\(key) = \(value) \n")
//            }
//        }
    }
    
    
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var passwordInput: UITextField!
    @IBOutlet weak var removeText: UITextField!
    
    var currentUser = String()
    
    @IBAction func logInButton(_ sender: Any) {
        if usernameInput.text != "" || passwordInput.text != "" {
            if var userData = UserDefaults.standard.dictionary(forKey: "logInInfo") as? [String: String]{
                if userData[usernameInput.text!] == passwordInput.text! {
                    currentUser = usernameInput.text!
                    self.performSegue(withIdentifier: "toHomeFromLogIn", sender: sender)
                    
                }else {
                    let alert = UIAlertController(title: "Input doesnt match", message: "Wrong username or password", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
            }
        }else {
            //creat alert for missing input
            let alert = UIAlertController(title: "Missing Info", message: "One or more fields are blank", preferredStyle: UIAlertControllerStyle.alert)
            //add action(s) (buttons)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            //show alert
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func Remove(_ sender: Any) {
        let userDefaults = UserDefaults.standard
        userDefaults.removeObject(forKey: "logInInfo")
        userDefaults.removeObject(forKey: "userInfo")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toHomeFromLogIn" {
            if let dest = segue.destination as? HomeViewController {
                dest.currentUser = currentUser
            }
        }
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

