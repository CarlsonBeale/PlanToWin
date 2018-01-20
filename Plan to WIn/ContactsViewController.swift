//
//  ContactsViewController.swift
//  Plan to WIn
//
//  Created by Carlson Beale on 1/13/18.
//  Copyright © 2018 StarlightMamba. All rights reserved.
//

import UIKit

class ContactsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var contactListTableView: UITableView!
    
    var currentUser = String()
    
    var userData: [[String: String]]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        userData = UserDefaults.standard.array(forKey: "userInfo") as? [[String: String]]
        userData = userData!.filter { $0["username"] != currentUser }
        
        contactListTableView.delegate = self
        contactListTableView.dataSource = self
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
        
        if userData![indexPath.row]["username"] == currentUser {
            
        }else {
            cell?.textLabel?.text = userData![indexPath.row]["firstName"]
        }
        
        return cell!
    }

}
