//
//  DescriptionViewController.swift
//  UserProfile
//
//  Created by Дмитро Вакулінський on 16.11.2021.
//

import UIKit

class DescriptionViewController: UIViewController {
    
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var textItem: UILabel!
    
    var dataInfo: Product?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageItem.image = UIImage(named: dataInfo?.image ?? "") ?? UIImage()
        textItem.text = dataInfo?.description

    }
    
}
