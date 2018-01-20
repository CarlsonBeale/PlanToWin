//
//  SignInViewController.swift
//  Plan to WIn
//
//  Created by Carlson Beale on 1/2/18.
//  Copyright © 2018 StarlightMamba. All rights reserved.
//

import UIKit
import RealmSwift

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    let userData:UserDefaults = UserDefaults.standard
    var userArray = [[String: String]]()
    var logInInfoDict = [String: String]()
    var tempDict = [String: String]()
    
    let user = UserInformation()
    let realm = try! Realm()
    
    @IBAction func signUp(_ sender: Any) {
        let error = checkInput()
        //if error dont segue
        if error == false {
            //store user info in realm object
            storeUserInfo()
            //go to logIn View
            self.performSegue(withIdentifier: "SignUp", sender: sender)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    //store user info to realm
    func storeUserInfo() {
        user.firstName = firstName.text!
        user.lastName = lastName.text!
        user.userName = username.text!
        user.phoneNumber = phoneNumber.text!
        user.password = password.text!
    }
    
    //check input for errors
    func checkInput() -> Bool {
        var error = Bool()
        //check if missing info
        if ((firstName.text == "") || (lastName.text == "") || (phoneNumber.text == "") || (username.text == "") || (password.text == "") || (confirmPassword.text == "")) {
            error = true
            //creat alert
            let alert = UIAlertController(title: "Missing Input", message: "One or more required fields is blank", preferredStyle: UIAlertControllerStyle.alert)
            //add action(s) (buttons)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            //show alert
            self.present(alert, animated: true, completion: nil)
            
            
        } else {
            error = checkUsername(username: username.text!)
            if error == false {
                error = checkPassword(userPassword: password.text!, userPasswordConfirm: confirmPassword.text!)
            }
        }
        
        return error
    }
    
    //check if username was taken
    func checkUsername(username: String) -> Bool{
        var usernameError = Bool()
        //if taken
        let user = realm.objects(UserInformation.self).filter("#userName = '\(username)'")
        if user.count > 0 {
            let usernameAlert = UIAlertController(title: "Used Username", message: "Username already in use", preferredStyle: UIAlertControllerStyle.alert)
            usernameAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(usernameAlert, animated: true, completion: nil)
            usernameError = true
        } else {
            usernameError = false
        }
        return usernameError
    }
    
    //check if passwords match
    func checkPassword(userPassword: String, userPasswordConfirm: String) -> Bool{ //make sure password and confirm password match
        var passwordError = Bool()
        if userPassword == userPasswordConfirm {
            passwordError = false
        } else {
            //create alert for passwords not matching
            let passwordAlert = UIAlertController(title: "Passwords dont match", message: "Passwords don't match", preferredStyle: UIAlertControllerStyle.alert)
            passwordAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(passwordAlert, animated: true, completion: nil)
            passwordError = true
        }
        
        return passwordError
    }
    
}

