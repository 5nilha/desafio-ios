//
//  UIImage+Extension.swift
//
//
//  Created by Fabio Quintanilha on 09/04/24.
//

import UIKit.UIImage

extension UIImage {

    convenience init?(namedOnFramework: String) {

        self.init(named: namedOnFramework, in: Utils.bundle, compatibleWith: nil)
    }
}
