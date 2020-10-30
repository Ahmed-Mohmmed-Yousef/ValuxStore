//
//  HomeModels.swift
//  ValuxStore
//
//  Created by Ahmed on 10/14/20.
//

import Foundation

// MARK: - HomeData
struct HomeData: Codable {
    let banners: [Banner]
    let products: [Product]
    let ad: String?
}

// MARK: - Banner
struct Banner: Codable {
    let id: Int
    let image: String
    let category, product: Product?
}

// MARK: - Product
struct Product: Codable {
    let id: Int
    let price: Double
    let oldPrice: Int
    let discount: Int?
    let image: String
    let name, productDescription: String
    let images: [String]
    let inFavorites, inCart: Bool

    enum CodingKeys: String, CodingKey {
        case id, price
        case oldPrice = "old_price"
        case discount, image, name
        case productDescription = "description"
        case images
        case inFavorites = "in_favorites"
        case inCart = "in_cart"
    }
}
