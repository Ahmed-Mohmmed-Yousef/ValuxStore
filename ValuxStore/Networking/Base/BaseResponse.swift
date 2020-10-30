//
//  BaseResponse.swift
//  ValuxStore
//
//  Created by Ahmed on 10/16/20.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
    let status: Bool
    let message: String?
    let data: T?
}
