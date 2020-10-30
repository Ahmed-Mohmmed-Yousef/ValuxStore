//
//  MainTabBarController.swift
//  ValuxStore
//
//  Created by Ahmed on 10/16/20.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    
    fileprivate func setupTabBar() {
        tabBar.tintColor = Theme.main
        let homeVC = HomeVC.instantiate()
        homeVC.title = "Home".localized
        homeVC.tabBarItem.image = #imageLiteral(resourceName: "ic_home")
    
        viewControllers = [homeVC]
    }

}
