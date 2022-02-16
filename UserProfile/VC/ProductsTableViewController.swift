//
//  ProductsTableViewController.swift
//  UserProfile
//
//  Created by Дмитро Вакулінський on 16.11.2021.
//

import UIKit

class ProductsTableViewController: UITableViewController {

    var viewModel: ProductsViewModel = ProductsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

       do {
            try viewModel.updateProducts()
           self.tableView.reloadData()
        } catch {
            print(error)
            }
        }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.products.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)

        cell.textLabel?.text = viewModel.products[indexPath.row].name
        cell.detailTextLabel?.text = viewModel.products[indexPath.row].price

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? DescriptionViewController,
           let selectedIndexPath = tableView.indexPathForSelectedRow{
            let product = viewModel.products[selectedIndexPath.row]
            destination.dataInfo = product
            
        }
    }
    
}

