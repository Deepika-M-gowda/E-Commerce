//
//  Category Cell.swift
//  E Commerce
//
//  Created by Joice George on 28/04/23.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    @IBOutlet weak var categoryImage: UIImageView!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    override func awakeFromNib() {
        categoryImage.layer.cornerRadius = categoryImage.frame.size.width / 2
    
    }
}

