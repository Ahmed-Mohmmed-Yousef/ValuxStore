//
//  LoadingImagesService.swift
//  ValuxStore
//
//  Created by Ahmed on 10/29/20.
//

import UIKit
import Alamofire
import AlamofireImage

class LoadingImagesService {
    
    static let shared = LoadingImagesService()
    
    private let imageCache = AutoPurgingImageCache()
    
    func loadImage(urlString: String, completion: @escaping(UIImage?) -> Void) {
        if let image = imageCache.image(withIdentifier: urlString) {
            completion(image)
        } else {
            AF.request(urlString).responseImage {[unowned self] (response) in
                switch response.result {
                
                case .success(let image):
                    imageCache.add(image, withIdentifier: urlString)
                    completion(image)
                case .failure(_):
                    completion(nil)
                }
            }
        }
    }
    
}
