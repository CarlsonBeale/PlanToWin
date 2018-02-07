//
//  ContactsViewController.swift
//  Plan to WIn
//
//  Created by Carlson Beale on 1/13/18.
//  Copyright © 2018 StarlightMamba. All rights reserved.
//

import UIKit
import RealmSwift

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var contactListTableView: UITableView!
    
    private var db: Realm? = try! Realm()
    private var userSession: UserSession? = (UIApplication.shared.delegate as! AppDelegate).userSession
    private var userData: Results<UserInformation>?
    private var currentUser = UserInformation()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let userSession = userSession { // success, no worries
            let loggedInUserName = userSession.loggedInUser!.userName;
            //userData = db!.objects(UserInformation.self).filter("#userName != '\(loggedInUserName)'")
            let userData = db!.objects(UserInformation.self).filter("#userName != '\(loggedInUserName)'")
            currentUser = userData.first!
            
            contactListTableView.delegate = self
            contactListTableView.dataSource = self
        }
        else {
            // no user session / return to login screen
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeView") as UIViewController!
            self.show(vc!, sender: vc)
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var userCount = Int()
        
        userCount = userData!.count
        
        return userCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = contactListTableView.dequeueReusableCell(withIdentifier: "cell")
        
        //cell?.textLabel?.text = userData![indexPath.row]["firstName"] as? String
        //display friends list of user
        //cell?.textLabel?.text = currentUser.friendsList[]
        return cell!
    }

}
