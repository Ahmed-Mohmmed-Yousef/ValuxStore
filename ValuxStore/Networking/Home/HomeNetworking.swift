//
//  HomeNetworking.swift
//  ValuxStore
//
//  Created by Ahmed on 10/14/20.
//

import Foundation

enum HomeNetworking {
    case getHomeData
}

extension HomeNetworking: TargetType {
    var baseURL: String {
        BaseURL
    }
    
    var path: String {
        "/home"
    }
    
    var method: HTTPMethod {
        .get
    }
    
    var task: Task {
        .requestPlain
    }
    
    var headers: [String : String]? {
        ["lang": "ar"]
    }
    
}
