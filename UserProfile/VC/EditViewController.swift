//
//  EditViewController.swift
//  UserProfile
//
//  Created by Дмитро Вакулінський on 24.11.2021.
//

import UIKit

class EditViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    var item: Item?
    var onEdit: ((_ value: String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        titleLabel.text = item?.title
        textField.text = item?.value
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.view.endEditing(true)
    }
    

    
    
}
extension EditViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        onEdit?(textField.text ?? "")
    }
    
}
