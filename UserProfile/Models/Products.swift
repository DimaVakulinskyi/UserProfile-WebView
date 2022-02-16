//
//  Products.swift
//  UserProfile
//
//  Created by Дмитро Вакулінський on 16.11.2021.
//

import Foundation


struct Product: Codable {
    var name: String
    var description: String
    var price: String
    var image: String
    
}
struct Products: Codable {
    var products: [Product]
}
