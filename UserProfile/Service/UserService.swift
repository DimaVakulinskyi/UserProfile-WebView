//
//  PlistService.swift
//  UserProfile
//
//  Created by Дмитро Вакулінський on 16.11.2021.
//

import Foundation

enum UserError: Error {
    case invalidURL
    case invalidFile
}

enum UserKeys: String {
    case imageURL = "imageURL"
    case FirstName = "FirstName"
    case LastName = "LastName"
    case DateOfBirth = "DateOfBirth"
    case PhoneNumber = "PhoneNumber"
    case Country = "Country"
    case State = "State"
    case City = "City"
    case Address = "Address"
    case PostalCode = "PostalCode"
}

class UserService {
    
    let entityReader = PlistStringReader<User>()
    
    func getUser() -> User {
        let imageURL = UserDefaults.standard.string(forKey: UserKeys.imageURL.rawValue)
        let FirstName = UserDefaults.standard.string(forKey: UserKeys.FirstName.rawValue)
        let LastName = UserDefaults.standard.string(forKey: UserKeys.LastName.rawValue)
        let DateOfBirth = UserDefaults.standard.string(forKey: UserKeys.DateOfBirth.rawValue)
        let PhoneNumber = UserDefaults.standard.string(forKey: UserKeys.PhoneNumber.rawValue)
        let Country = UserDefaults.standard.string(forKey: UserKeys.Country.rawValue)
        let State = UserDefaults.standard.string(forKey: UserKeys.State.rawValue)
        let City = UserDefaults.standard.string(forKey: UserKeys.City.rawValue)
        let Address = UserDefaults.standard.string(forKey: UserKeys.Address.rawValue)
        let PostalCode = UserDefaults.standard.string(forKey: UserKeys.PostalCode.rawValue)
        
        let user =  User(image: imageURL as? URL,
                         FirstName: FirstName ?? "",
                         LastName: LastName ?? "",
                         DateOfBirth: DateOfBirth as? Date,
                         PhoneNumber: PhoneNumber ?? "",
                         Country: Country ?? "",
                         State: State ?? "",
                         City: City ?? "",
                         Address: Address ?? "",
                         PostalCode: PostalCode ?? "")

        
        if FirstName == nil || LastName == nil {
            do {
                return try entityReader.getStrings(name: "User")
            } catch {
                return user
            }
            
        }
        
        
        return user
    }
    
    
    }
   

