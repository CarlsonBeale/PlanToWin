//
//  SignInViewController.swift
//  Plan to WIn
//
//  Created by Carlson Beale on 1/2/18.
//  Copyright © 2018 StarlightMamba. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

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
    
    @IBAction func signUp(_ sender: Any) {
        let error = checkInput()
        //if error dont segue
        if error == false {
            //add new info to userDefaults
            addInfoArrayToDefaults(key: "userInfo")
            //go to logIn View
            self.performSegue(withIdentifier: "SignUp", sender: sender)
        }
        
    }
    //add if user data to array
    func addInfoArrayToDefaults(key: String) {
        
        //check if userDefaults exists already
        if var uArray = userData.array(forKey: key) as? [[String: String]] {
            //add new entry to array
            uArray.append(tempDict)
            //add back to userDefaults
            userData.set(uArray, forKey: key)
        } else {
            //add tempDict to array
            userArray.append(tempDict)
            //creat new userDefault using userArray
            userData.set(userArray, forKey: key)
        }
    }
    //add info to Dictionary containing username and password
    func addInfoDictToDefaults(username: String, password: String, key: String) {
        //check if userDefaults exists already
        if var uDict = userData.dictionary(forKey: key) {
            //add new entry to array
            uDict[username] = password
            //add back to userDefaults
            userData.set(uDict, forKey: key)
        } else {
            //creat new userDefault using userArray
            userData.set(logInInfoDict, forKey: key)
        }
    }
    

    //check input for errors
    func checkInput() -> Bool {
        var error = Bool()
        //check if missing info
        if ((firstName.text == "") || (lastName.text == "") || (phoneNumber.text == "") || (username.text == "") || (password.text == "") || (confirmPassword.text == "")) {
            error = true
            //print("1")
            //print(firstName.text, lastName.text, phoneNumber.text, username.text, password.text, confirmPassword.text)
            //creat alert
            let alert = UIAlertController(title: "Missing Input", message: "One or more required fields is blank", preferredStyle: UIAlertControllerStyle.alert)
            //add action(s) (buttons)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            //show alert
            self.present(alert, animated: true, completion: nil)
            
            
        } else {
            tempDict = ["firstName": firstName.text!, "lastName": lastName.text!, "username": username.text!, "phoneNumber": phoneNumber.text!]

            error = checkUsername(username: username.text!, userPassword: password.text!, userPasswordConfirm: confirmPassword.text!)
        }
        
        return error
    }
    //check if username was taken
    func checkUsername(username: String, userPassword: String, userPasswordConfirm: String) -> Bool{
        var usernameError = Bool()
        //if taken
        if let usernameData = userData.array(forKey: "logInInfo") as? [[String: String]]{
            for logInDict in usernameData {
                if logInDict["username"] == username {
                    //create alert for username already in use
                    let usernameAlert = UIAlertController(title: "Used Username", message: "Username already in use", preferredStyle: UIAlertControllerStyle.alert)
                    usernameAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(usernameAlert, animated: true, completion: nil)
                }
            }
            usernameError = true
        } else { //make sure password and confirm password match
            
            if userPassword == userPasswordConfirm {
                logInInfoDict[username] = userPassword
                addInfoDictToDefaults(username: username, password: userPassword, key: "logInInfo")
                usernameError = false
            } else {
                //create alert for passwords not matching
                let passwordAlert = UIAlertController(title: "Passwords dont match", message: "Passwords don't match", preferredStyle: UIAlertControllerStyle.alert)
                passwordAlert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(passwordAlert, animated: true, completion: nil)
                usernameError = true
            }
        }
        
        return usernameError
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
