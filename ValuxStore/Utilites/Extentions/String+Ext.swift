//
//  String+Ext.swift
//  ValuxStore
//
//  Created by Ahmed on 10/16/20.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
