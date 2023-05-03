//
//  Banner Cell.swift
//  E Commerce
//
//  Created by Joice George on 28/04/23.
//

import UIKit

class BannerCell: UICollectionViewCell {
    
    @IBOutlet weak var banerImageView: UIImageView!
    
    override  func awakeFromNib() {
        banerImageView.layer.cornerRadius = 5
    }
}
