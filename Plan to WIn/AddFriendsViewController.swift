//
//  AddFriendsViewController.swift
//  Plan to WIn
//
//  Created by Carlson Beale on 3/13/18.
//  Copyright © 2018 StarlightMamba. All rights reserved.
//

import UIKit
import RealmSwift

class AddFriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    private var userSession: UserSession? = (UIApplication.shared.delegate as! AppDelegate).userSession
    
    @IBOutlet weak var addFriends: UITableView!
    
    @IBAction func donePressed(_ sender: Any) {
        //add friend/s to list of loggedInUser
        let friendSelected = db.allUsers().filter("#userName == '\(usernameSelected)'").first
        userSession?.loggedInUser?.friendsList.append(friendSelected!)
    }
    
    private var userData: Results<UserInformation>?
    
    let db = Database()
    var usernameSelected = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let userSession = userSession { // success, no worries
            let loggedInUserName = userSession.loggedInUser?.userName
            //userData = db!.objects(UserInformation.self).filter("#userName != '\(loggedInUserName)'")
            userData = db.allUsers().filter("#userName != '\(String(describing: loggedInUserName))'")
            print(loggedInUserName as Any)
            
            //contactListTableView.delegate = self
            //contactListTableView.dataSource = self
            let backgroundImage: UIImageView!
            backgroundImage = UIImageView(frame: UIScreen.main.bounds)
            backgroundImage.image = UIImage(named: (userSession.loggedInUser?.background)!)
            backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
            self.view.insertSubview(backgroundImage, at: 0)
        }
        else {
            // no user session / return to login screen
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeView") as UIViewController!
            self.show(vc!, sender: vc)
            
        }
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var userCount = Int()
        
        userCount = userData!.count
        print (userCount)
        return userCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = addFriends.dequeueReusableCell(withIdentifier: "cell")
        
        cell?.textLabel?.text = userData![indexPath.row]["userName"] as? String
        print(userData![indexPath.row]["userName"] as Any)
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        usernameSelected = (userData![indexPath.row]["userName"] as? String)!
    }
    

}
