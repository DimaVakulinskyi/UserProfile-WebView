//
//  DateStringFormatter.swift
//  UserProfile
//
//  Created by Дмитро Вакулінський on 24.11.2021.
//

import Foundation

extension Date {
    
    func dateToString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
}

extension String {
    func stringToDate(format: String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self)
        
    }
}
