//
//  PlistStringsReader.swift
//  UserProfile
//
//  Created by Дмитро Вакулінський on 16.11.2021.
//

import Foundation

class PlistStringReader<T: Codable> {
    
    func getStrings(name: String) throws -> T {
        guard let path = Bundle.main.path(forResource: name, ofType: "plist") else {
            throw UserError.invalidURL
        }
        
        guard let xml = FileManager.default.contents(atPath: path) else {
            throw UserError.invalidFile
        }
        return try PropertyListDecoder().decode(T.self, from: xml)
        
    }
}
