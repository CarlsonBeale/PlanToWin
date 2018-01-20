//
//  HomeViewController.swift
//  Plan to WIn
//
//  Created by Carlson Beale on 1/2/18.
//  Copyright © 2018 StarlightMamba. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBAction func creatEventButton(_ sender: Any) {
    }
    @IBAction func viewEventButton(_ sender: Any) {
    }
    @IBAction func contactsButton(_ sender: Any) {
        performSegue(withIdentifier: "toContactsFromHome", sender: sender)
    }
    
    var currentUser = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toContactsFromHome" {
            if let dest = segue.destination as? ContactsViewController {
                
            }
        }
    }
 

}
