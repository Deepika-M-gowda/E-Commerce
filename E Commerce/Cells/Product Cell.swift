//
//  Product Cell.swift
//  E Commerce
//
//  Created by Joice George on 28/04/23.
//

import UIKit

class ProductCell: UICollectionViewCell {
    @IBOutlet weak var favouriteImage: UIImageView!
    @IBOutlet weak var truckImage: UIImageView!
    @IBOutlet weak var offerPercentageLabel: UILabel!
    
    @IBOutlet weak var yellowTruckImage: UIImageView!
    @IBOutlet weak var actualPriceLabel: UILabel!
    @IBOutlet weak var offerPriceLabel
    : UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var produvtImage: UIImageView!
    
    override func awakeFromNib() {
        parentView.layer.borderWidth = 0.5
        parentView.layer.borderColor = UIColor.gray.cgColor
    }
}

