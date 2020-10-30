//
//  ProductCell.swift
//  ValuxStore
//
//  Created by Ahmed on 10/16/20.
//

import UIKit

class ProductCell: UICollectionViewCell {
    
    static let id = "ProductCell"

    var productVM: ProductViewModel?
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productOlderPriceLabel: UILabel!
    @IBOutlet weak var productDiscountLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var cartButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backView.clipsToBounds = true
        backView.layer.cornerRadius = 10
    }
    
    func configuration(productVM: ProductViewModel) {
        self.productVM = productVM
        productVM.getImage {[unowned self] (image) in
            productImageView.image = image ?? #imageLiteral(resourceName: "noImage")
        }
        productNameLabel.text = productVM.name
        productPriceLabel.text = productVM.price
        favoriteButton.tintColor = UIColor(named: productVM.inFavorites ? "Main" : "Main Gray")
        cartButton.tintColor = UIColor(named: productVM.inCart ? "Main" : "Main Gray")
        let isDisCount = productVM.discount == 0
        productDiscountLabel.isHidden =  isDisCount
        productOlderPriceLabel.isHidden = isDisCount
        productDiscountLabel.text = "\(productVM.discount) %"
        productOlderPriceLabel.text = productVM.oldPrice
    }

    @IBAction func favoriteButtonTapped(_ sender: UIButton) {
    }
}
