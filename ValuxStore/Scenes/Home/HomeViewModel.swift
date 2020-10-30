//
//  HomeViewModel.swift
//  ValuxStore
//
//  Created by Ahmed on 10/16/20.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
    private let productVMs: PublishSubject = PublishSubject<[ProductViewModel]>()
    private let banners: PublishSubject = PublishSubject<[Banner]>()
    private let mssageErorr: BehaviorRelay = BehaviorRelay<String>(value: "")
    
    let isLoading: BehaviorRelay = BehaviorRelay<Bool>(value: false)
    
    var productsObsearvable: Observable<[ProductViewModel]> {
        productVMs.asObserver()
    }
    
    func viewDidLoad() {
        isLoading.accept(true)
        HomeAPI.sharde.getHomeData {[unowned self] (result) in
            self.isLoading.accept(false)
            
            switch result {
            
            case .success(let response):
                if let products = response.data?.products {
                    let productVMs: [ProductViewModel] = products.map{ ProductViewModel.init(product: $0) }
                    self.productVMs.onNext(productVMs)
                } else {
                    self.mssageErorr.accept(response.message ?? "")
                }
            case .failure(let erorr):
                self.mssageErorr.accept(erorr.localizedDescription)
                print(erorr.localizedDescription)
            }
        }
    }
    
}
