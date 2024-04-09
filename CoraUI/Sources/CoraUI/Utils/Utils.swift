//
//  File.swift
//  
//
//  Created by Fabio Quintanilha on 09/04/24.
//

import Foundation

class Utils {

    static var bundle: Bundle? {
        return Bundle(for: Utils.self)
    }

    static var bundleIdentifier: String {
        let bundleName = Utils.bundle?.bundleIdentifier ?? ""
        return bundleName
    }
}
