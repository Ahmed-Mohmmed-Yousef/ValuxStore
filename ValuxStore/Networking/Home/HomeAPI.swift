//
//  HomeAPI.swift
//  ValuxStore
//
//  Created by Ahmed on 10/14/20.
//

import Foundation
import Alamofire
class HomeAPI: BaseAPI<HomeNetworking> {
    
    static let sharde = HomeAPI()
    
    //MARK:- Request
    func getHomeData(completion: @escaping(Result<BaseResponse<HomeData>, AFError>) -> Void) {
        self.fetchData(target: .getHomeData, responseClass: BaseResponse<HomeData>.self) { (response) in
            completion(response)
        }
    }
}
