//
//  UserTableViewController.swift
//  UserProfile
//
//  Created by Дмитро Вакулінський on 13.11.2021.
//

import UIKit
import SafariServices

class UserTableViewController: UITableViewController {
    
    var model = UserViewModel()
    var user: User?
    
    @IBAction func saveButton(_ sender: Any) {
        model.saveUser(user: model.user)
    }
    @IBAction func webView(_ sender: Any) {
        if let url = URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ&ab_channel=RickAstley") {
            let viewController = SFSafariViewController(url: url)
            self.present(viewController, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        model.updateSections()
        self.tableView.reloadData()
        
    // MARK: - Table view data source
        
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return model.sections.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return  model.sections[section].item.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return model.sections[section].title
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = model.sections[indexPath.section].item[indexPath.row]
        
        switch item {
        case .item(let item):
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
            cell.textLabel?.text = item.title
            cell.detailTextLabel?.text = item.value
            return cell
        case .date(let item):
            let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath)
            cell.textLabel?.text = item.title
            cell.detailTextLabel?.text = item.value
            return cell
        case .image(let imageURL):
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCell", for: indexPath)
            if let imagecell = cell as? ImageTableViewCell {
                imagecell.photoField.image = UIImage(contentsOfFile: imageURL?.relativePath ?? "")
            }
            return cell
        }
        
       
    }
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let item = model.sections[indexPath.section].item[indexPath.row]
            switch item {
            case .image(_):
                let imagePicker = UIImagePickerController()
                imagePicker.sourceType = .photoLibrary
                imagePicker.delegate = self
                self.present(imagePicker, animated: true, completion: nil)
            case .item(_):
                self.performSegue(withIdentifier: "editCell", sender: self)
            case .date(_):
                self.performSegue(withIdentifier: "datePickerSegue", sender: self)
            }
            
        }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? EditViewController,
           let selectedIndexPath = tableView.indexPathForSelectedRow {
            destination.onEdit = { [weak self] value in
                self?.model.editUserItem(indexPath: selectedIndexPath, newValue: value)
                self?.model.updateSections()
                self?.tableView.reloadData()
            }
            let content = model.sections[selectedIndexPath.section].item[selectedIndexPath.row]
            switch content {
            case.item(let item):
                destination.item = item
            default:
                break
            }
        } else if let destination = segue.destination as? DatePickerController,
                  let selectedIndexPath = tableView.indexPathForSelectedRow {
            destination.dateChanged = { [weak self] newDate in
                self?.model.editDate(date: newDate)
                self?.model.updateSections()
                self?.tableView.reloadData()
            }
            
        }
    }

}

extension UserTableViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imageURL = info[.imageURL] as? URL
        self.model.editUserPic(url: imageURL)
        self.model.updateSections()
        self.tableView.reloadData()
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}

    
    
    

