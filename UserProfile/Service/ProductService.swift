//
//  ProductService.swift
//  UserProfile
//
//  Created by Дмитро Вакулінський on 24.11.2021.
//

import Foundation

class ProductService {
    let productReader = PlistStringReader<Products>()
    
    func getProducts() throws -> Products {
        return try productReader.getStrings(name: "Products")
    }
}
