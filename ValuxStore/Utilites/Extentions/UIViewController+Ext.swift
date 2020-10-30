//
//  UIViewController+Ext.swift
//  ValuxStore
//
//  Created by Ahmed on 10/16/20.
//

import Foundation
import UIKit


extension UIViewController {
    
    class func instantiate<T: UIViewController>() -> T {
        
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
//        let identifier = String(describing: self)
        return storyboard.instantiateInitialViewController()!
    }
}

