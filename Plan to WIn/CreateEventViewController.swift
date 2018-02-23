//
//  CreateEventViewController.swift
//  Plan to WIn
//
//  Created by Carlson Beale on 1/2/18.
//  Copyright © 2018 StarlightMamba. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController {

    @IBOutlet weak var startTimeTextField: UITextField!
    let datePicker = UIDatePicker()
    
    
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
        //assign date picker to text field
        startTimeTextField.inputView = datePicker
    }

    @objc func donePressed() {
        //format date and time
        let formatDateTime = DateFormatter()
        DateFormatter.localizedString(from: datePicker.date, dateStyle: .short, timeStyle: .none)
        
        startTimeTextField.text = "\(datePicker.date)"
        self.view.endEditing(true)
    }
}
