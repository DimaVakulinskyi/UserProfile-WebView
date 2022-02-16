//
//  DatePickerController.swift
//  UserProfile
//
//  Created by Дмитро Вакулінський on 25.11.2021.
//

import UIKit

class DatePickerController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var dateChanged: ((_ date: Date?) -> Void)?
    
    var date: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let date = date {
            datePicker.date = date
        }
        
        datePicker.datePickerMode = .dateAndTime
        datePicker.preferredDatePickerStyle = .inline
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        dateChanged?(datePicker.date)
    }


}
