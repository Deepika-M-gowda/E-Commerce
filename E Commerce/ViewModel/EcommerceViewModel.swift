//
//  EcommerceViewModel.swift
//  E Commerce
//
//  Created by Joice George on 28/04/23.
//

import Foundation
import Kingfisher
import Alamofire
import UIKit

class EcommerceViewModel: NSObject{
    let apiManager: ApiManger = ApiManger()
    var bannerArray: [Values]?
    var productsArray: [Values]?
    var categoryArray: [Values]?
    
    
    func getData(handler: @escaping () -> ()) {
        apiManager.fetchData(handler: { response in
            self.bannerArray = response.first(where: {$0.type == "banners"})?.values
            self.productsArray =  response.first(where: {$0.type == "products"})?.values
            self.categoryArray = response.first(where: {$0.type == "category"})?.values
            print("banner array", self.bannerArray?.map {$0.name} as Any)
            handler()
        })
    }
    
    func setCategoryCell(cell: CategoryCell, index: Int) {
        cell.categoryLabel.text = self.categoryArray?.map {$0.name}[index]
        if let url = self.categoryArray?.map({$0.image_url})[index] {
            cell.categoryImage.kf.setImage(with: URL(string: url))
        }
        cell.categoryImage.backgroundColor = .random()
        
    }
    
    func setBannerCell(cell: BannerCell, index: Int) {
        if let url = self.bannerArray?.map({$0.banner_url})[index] {
            cell.banerImageView.kf.setImage(with: URL(string: url))
        }
    }
    
    func setProductCell(cell: ProductCell, index: Int) {
        if let url = self.productsArray?.map({$0.image})[index] {
            print("Url", url)
            cell.produvtImage.kf.setImage(with: URL(string: url))
        }
        cell.productNameLabel.text = self.productsArray?.map({$0.name})[index]
        if self.productsArray?.map({$0.is_express})[index] == true {
            cell.yellowTruckImage.isHidden = false
        } else {
            cell.yellowTruckImage.isHidden = true
        }
        if let offer = self.productsArray?.map({$0.offer})[index] {
            if offer > 0 {
                cell.offerPercentageLabel.isHidden = false
                cell.offerPercentageLabel.text = String(offer) + "% Offer"
            }
        }
        if let actualPrice = self.productsArray?.map({$0.actual_price})[index], let offerPrice = self.productsArray?.map({$0.offer_price})[index] {
            if actualPrice == offerPrice {
                cell.actualPriceLabel.isHidden = true
                cell.offerPriceLabel.text = String(actualPrice)
            } else {
                cell.actualPriceLabel.text = String(actualPrice)
                cell.offerPriceLabel.text = String(offerPrice)
            }
        }
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
    
extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}


