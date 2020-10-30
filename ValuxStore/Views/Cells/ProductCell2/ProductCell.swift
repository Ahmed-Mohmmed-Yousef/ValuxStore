//
//  ProductCell.swift
//  ValuxStore
//
//  Created by Ahmed on 10/29/20.
//

import UIKit

class ProductCell: UITableViewCell {

    static let id = "ProductCell"
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var desdriptionLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var oldPriceLabel: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var cartButton: UIButton!
    @IBOutlet weak var discountLabel: UILabel!
    
    var productVM: ProductViewModel?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        backView.layer.cornerRadius = 10
        backView.clipsToBounds = true
        backView.layer.borderWidth = 1
        backView.layer.borderColor = UIColor.gray.cgColor
    }
    
    func configuration(productVM: ProductViewModel) {
        self.productVM = productVM
        productVM.getImage {[unowned self] (image) in
            productImageView.image = image ?? #imageLiteral(resourceName: "noImage")
        }
        desdriptionLabel.text = productVM.productDescription
        priceLabel.text = productVM.price
        oldPriceLabel.text = productVM.oldPrice
        favoriteButton.tintColor = UIColor(named: productVM.inFavorites ? "Main" : "Main Gray")
        cartButton.tintColor = UIColor(named: productVM.inCart ? "Main" : "Main Gray")
        discountLabel.isHidden =  productVM.discount.isEmpty
        discountLabel.text = productVM.discount
    }
    
}
