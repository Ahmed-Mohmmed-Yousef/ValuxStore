//
//  ProductViewModel.swift
//  ValuxStore
//
//  Created by Ahmed on 10/29/20.
//

import Foundation
import UIKit
import RxSwift

class ProductViewModel {
    private let product: Product
    
    init(product: Product) {
        self.product = product
    }
    
    var price: String {
        String(format: "%.0f", product.price) + " EG"
    }
    var oldPrice: String { "\(product.oldPrice) EG" }
    var discount: Int { product.discount ?? 0  }
    var imageUrlString: String { product.image }
    var name: String { product.name }
    var productDescription: String { product.productDescription }
    var imagesUrlStrings: [String] { product.images }
    var inFavorites: Bool { product.inFavorites }
    var inCart: Bool { product.inCart }
    
    func getImage(completion: @escaping(UIImage?) -> Void) {
        LoadingImagesService.shared.loadImage(urlString: imageUrlString) { (image) in
            completion(image)
        }
    }
    
}
