//
//  CreateEventViewController.swift
//  Plan to WIn
//
//  Created by Carlson Beale on 1/2/18.
//  Copyright © 2018 StarlightMamba. All rights reserved.
//

import UIKit
import RealmSwift

class CreateEventViewController: UIViewController {

    let datePicker = UIDatePicker()
    var activeTextField: UITextField!
    let db = Database()
    
    @IBOutlet weak var eventTitleTextField: UITextField!
    @IBOutlet weak var eventLocationTextField: UITextField!
    @IBOutlet weak var startTimeTextField: UITextField!
    @IBOutlet weak var endTimeTextField: UITextField!
    @IBOutlet weak var eventInviteTableView: UITableView!
    
    @IBAction func doneButton(_ sender: Any) {
        let eventCreated = EventDetails()
        
        eventCreated.title = eventTitleTextField.text!
        eventCreated.location = eventLocationTextField.text!
        eventCreated.startTime = startTimeTextField.text!
        eventCreated.endTime = endTimeTextField.text!
        
        db.addEvent(event: eventCreated)
    }
    
//    //keeping data for saving
//    var startDate = NSDate
//    var endDate = NSDate
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePicker()
        // Do any additional setup after loading the view.
    }

    
    func createDatePicker() {

        //format
        datePicker.datePickerMode = .dateAndTime

        //toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        //create button item
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: false)

        startTimeTextField.inputAccessoryView = toolbar
        endTimeTextField.inputAccessoryView = toolbar
        //assign date picker to text field
        startTimeTextField.inputView = datePicker
        endTimeTextField.inputView = datePicker
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    
    @objc func donePressed(time: Bool) {
        //format date and time
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        
        
        activeTextField.text = dateFormatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
}
