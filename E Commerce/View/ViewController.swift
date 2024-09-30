//
//  ViewController.swift
//  E Commerce
//
//  Created by Joice George on 28/04/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var categoryCollection: UICollectionView!
    @IBOutlet weak var bannerCollection: UICollectionView!
    @IBOutlet weak var productCollection: UICollectionView!
    
    var viewModel: EcommerceViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = EcommerceViewModel()
        
        registerCollectionViewCells()
        setCollectionView()
        
        viewModel?.getData {
            DispatchQueue.main.async {
                self.categoryCollection.reloadData()
                self.productCollection.reloadData()
                self.bannerCollection.reloadData()
            }
        }
    }
    
    func registerCollectionViewCells() {
        categoryCollection.register(UINib(nibName: "Category Cell", bundle: Bundle.main), forCellWithReuseIdentifier: "categoryCell")
        bannerCollection.register(UINib(nibName: "Banner Cell", bundle: Bundle.main), forCellWithReuseIdentifier: "bannerCell")
        productCollection.register(UINib(nibName: "Product Cell", bundle: Bundle.main), forCellWithReuseIdentifier: "productCell")

    }
    
    func setCollectionView() {
        categoryCollection.delegate = self
        bannerCollection.delegate = self
        productCollection.delegate = self
        categoryCollection.dataSource = self
        bannerCollection.dataSource = self
        productCollection.dataSource = self
        
        categoryCollection.showsHorizontalScrollIndicator = false
        bannerCollection.showsHorizontalScrollIndicator = false
        productCollection.showsHorizontalScrollIndicator = false
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.categoryCollection {
            return viewModel?.categoryArray?.count ?? 0
        } else if collectionView == self.bannerCollection {
            return viewModel?.bannerArray?.count ?? 0
        } else {
            return viewModel?.productsArray?.count ?? 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.categoryCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "categoryCell", for: indexPath) as! CategoryCell
            viewModel?.setCategoryCell(cell: cell, index: indexPath.row)
            return cell
        } else if collectionView == self.productCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCell", for: indexPath) as! ProductCell
            viewModel?.setProductCell(cell: cell, index: indexPath.row)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerCell", for: indexPath) as! BannerCell
            viewModel?.setBannerCell(cell: cell, index: indexPath.row)

            return cell

        }
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.categoryCollection {
            return CGSize(width: 100.0, height: 100.0)
        } else if collectionView == self.bannerCollection {
            return CGSize(width: 370, height: 180)
        } else {
            return CGSize(width: 200, height: 350)
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if collectionView == productCollection {
            return 20
        } else if collectionView == bannerCollection {
            return 10
        } else {
            return 10
        }
    }
}

