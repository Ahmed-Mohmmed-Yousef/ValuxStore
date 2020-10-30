//
//  HomeVC.swift
//  ValuxStore
//
//  Created by Ahmed on 10/16/20.
//

import UIKit
import RxCocoa
import RxSwift

class HomeVC: UIViewController {

    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewModel: HomeViewModel = HomeViewModel()
    let disBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        bindCollectionView()
        viewModel.viewDidLoad()
    }
    
    private func bindCollectionView() {
        collectionView.register(UINib(nibName: "ProductCell", bundle: .main), forCellWithReuseIdentifier: ProductCell.id)
        viewModel.productsObsearvable.bind(to: collectionView.rx.items(cellIdentifier: ProductCell.id, cellType: ProductCell.self)) { (row,item,cell) in
            cell.configuration(productVM: item)
        }
        .disposed(by: disBag)
    }

}

extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width - 32
        let height: CGFloat = width * 0.9
        return CGSize(width: width, height: height)
    }
    
    
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 10
//    }
    
}
