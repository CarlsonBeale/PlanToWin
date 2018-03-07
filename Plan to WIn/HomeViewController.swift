//
//  HomeViewController.swift
//  Plan to WIn
//
//  Created by Carlson Beale on 1/2/18.
//  Copyright © 2018 StarlightMamba. All rights reserved.
//

import UIKit
import RealmSwift

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    private var userSession: UserSession? = (UIApplication.shared.delegate as! AppDelegate).userSession
    
    @IBAction func creatEventButton(_ sender: Any) {
    }
    @IBAction func viewEventButton(_ sender: Any) {
    }
    @IBAction func contactsButton(_ sender: Any) {
        performSegue(withIdentifier: "toContactsFromHome", sender: sender)
    }
    @IBOutlet weak var backgroundTableView: UITableView!
    
     let db = Database()
    
    @IBAction func saveBackground(_ sender: Any) {
        userSession?.loggedInUser?.background = currentImage
    }
    var currentUser = String()
    
    var imageArray = ["Blue Mac", "Dragon", "Green Lion", "Green Mac", "Jaws Movie", "Master Sword", "Pokeball Cynd", "Weird Tree"]
    var imageArray2 = [#imageLiteral(resourceName: "Blue Mac"), #imageLiteral(resourceName: "Dragon"), #imageLiteral(resourceName: "Green Lion"), #imageLiteral(resourceName: "Green Mac"), #imageLiteral(resourceName: "Jaws Movie"), #imageLiteral(resourceName: "Master Sword"), #imageLiteral(resourceName: "Pokeball Cynd"), #imageLiteral(resourceName: "Weird Tree")]
    var currentImage = String()
    var backgroundImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //set background to saved image
        backgroundImage = UIImageView(frame: UIScreen.main.bounds)
//        backgroundImage.image = UIImage(named: (userSession?.loggedInUser?.background)!)
//        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
//        self.view.insertSubview(backgroundImage, at: 0)
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = imageArray[indexPath.row]
        cell.backgroundColor = UIColor.clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let image = imageArray2[indexPath.row]
        currentImage = imageArray[indexPath.row]
        //backgroundImage.image =  image
        backgroundImage.image = UIImage(named: "\(currentImage).png")
        backgroundImage.contentMode = UIViewContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "toContactsFromHome" {
//            if let dest = segue.destination as? ContactsViewController {
//
//            }
//        }
//    }
 

}
