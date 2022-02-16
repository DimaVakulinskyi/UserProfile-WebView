//
//  UserViewModel.swift
//  UserProfile
//
//  Created by Дмитро Вакулінський on 13.11.2021.
//

import Foundation
import UIKit

enum Content {
    case image(_ imageURL: URL?)
    case item(_ item: Item)
    case date(_ item: Item)
}

struct Section {
    var title: String
    var item: [Content]
}

struct Item {
    let title: String
    let value: String
}

class UserViewModel {

    var userService: UserService = UserService()
    var sections: [Section] = []
    var user: User
    
    init() {
        self.user = userService.getUser()
    }
    func updateSections() {
        let dob = user.DateOfBirth?.dateToString(format: "DD.MM.YYYY")
        sections = [Section(title: "", item: [.image(user.image)]),
                    Section(title: "Basic Info", item: [.item(Item(title: "FirstName", value: user.FirstName)),
                                                        .item(Item(title: "LastName", value: user.LastName)),
                                                        .date(Item(title: "DateOfBirth", value: dob ?? ""))]),
                    Section(title: "Phone Number", item: [.item(Item(title: "PhoneNumber", value: user.PhoneNumber))]),
                    Section(title: "Address", item: [.item(Item(title: "Country", value: user.Country)),
                                                     .item(Item(title: "State", value: user.State)),
                                                     .item(Item(title: "City", value: user.City)),
                                                     .item(Item(title: "Address", value: user.Address)),
                                                     .item(Item(title: "PostalCode", value: user.PostalCode))])]
    }
    
    func editUserItem(indexPath: IndexPath, newValue: String) {
        switch indexPath.section {
        case 1:
            switch indexPath.row {
            case 0:
                self.user.FirstName = newValue
            case 1:
                self.user.LastName = newValue
            case 2:
                self.user.PhoneNumber = newValue
            case 3:
                self.user.Country = newValue
            case 4:
                self.user.State = newValue
            case 5:
                self.user.City = newValue
            case 6:
                self.user.Address = newValue
            case 7:
                self.user.PostalCode = newValue
            default:
                break
            }
            
        default:
            break
        }

    }
    
    func editUserPic(url: URL?) {
        self.user.image = url
    }
    
    func editDate(date: Date?) {
        self.user.DateOfBirth = date
    }
    func saveUser(user: User) {
        UserDefaults.standard.set(user.FirstName, forKey: UserKeys.FirstName.rawValue)
        UserDefaults.standard.set(user.LastName, forKey: UserKeys.LastName.rawValue)
        UserDefaults.standard.set(user.DateOfBirth, forKey: UserKeys.DateOfBirth.rawValue)
        UserDefaults.standard.set(user.PhoneNumber, forKey: UserKeys.PhoneNumber.rawValue)
        UserDefaults.standard.set(user.Country, forKey: UserKeys.Country.rawValue)
        UserDefaults.standard.set(user.State, forKey: UserKeys.State.rawValue)
        UserDefaults.standard.set(user.City, forKey: UserKeys.City.rawValue)
        UserDefaults.standard.set(user.Address, forKey: UserKeys.Address.rawValue)
        UserDefaults.standard.set(user.PostalCode, forKey: UserKeys.PostalCode.rawValue)
        
        }
    
}
      

