//
//  ProductsViewModel.swift
//  UserProfile
//
//  Created by Дмитро Вакулінський on 16.11.2021.
//

import Foundation
import UIKit

class ProductsViewModel {

    var products: [Product] = []
    let service = ProductService()
   

    func updateProducts() throws {
        self.products = try service.getProducts().products
    }
}
