//
//  User.swift
//  UserProfile
//
//  Created by Дмитро Вакулінський on 13.11.2021.
//

import Foundation
import UIKit

struct User: Codable {
    
    enum CodingKeys: String, CodingKey {
        
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
    
    init(image: URL?,
         FirstName: String,
         LastName: String,
         DateOfBirth: Date?,
         PhoneNumber: String,
         Country: String,
         State: String,
         City: String,
         Address: String,
         PostalCode: String){
        
        self.image = image
        self.FirstName = FirstName
        self.LastName = LastName
        self.DateOfBirth = DateOfBirth
        self.PhoneNumber = PhoneNumber
        self.Country = Country
        self.State = State
        self.City = City
        self.Address = Address
        self.PostalCode = PostalCode
    }
    
    init(from decoder: Decoder) throws {
        let decoded = try decoder.container(keyedBy: CodingKeys.self)
        self.FirstName = try decoded.decode(String.self, forKey: .FirstName)
        self.LastName = try decoded.decode(String.self, forKey: .LastName)
        let dobStr =  try decoded.decode(String.self, forKey: .DateOfBirth)
        self.DateOfBirth = dobStr.stringToDate(format: "DD.MM.YYYY") ?? Date()
        self.PhoneNumber = try decoded.decode(String.self, forKey: .PhoneNumber)
        self.Country = try decoded.decode(String.self, forKey: .Country)
        self.State = try decoded.decode(String.self, forKey: .State)
        self.City = try decoded.decode(String.self, forKey: .City)
        self.Address = try decoded.decode(String.self, forKey: .Address)
        self.PostalCode = try decoded.decode(String.self, forKey: .PostalCode)
    }
    
    var image: URL?
    var FirstName: String = ""
    var LastName: String = ""
    var DateOfBirth: Date?
    var PhoneNumber: String = ""
    var Country: String = ""
    var State: String =  ""
    var City: String = ""
    var Address: String = ""
    var PostalCode: String = ""
}
