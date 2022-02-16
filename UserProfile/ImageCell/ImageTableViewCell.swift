//
//  ImageTableViewCell.swift
//  UserProfile
//
//  Created by Дмитро Вакулінський on 14.11.2021.
//

import UIKit

class ImageTableViewCell: UITableViewCell {

    @IBOutlet weak var photoField: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
  
    }
    func setImage(images: Image){
    photoField.image = images.image
    }

}
