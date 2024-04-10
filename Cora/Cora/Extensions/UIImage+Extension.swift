//
//  UIImage+Extension.swift
//  Cora
//
//  Created by Fabio Quintanilha on 10/04/24.
//

import UIKit

extension UIImage{
    
    class func getSegRect(color: CGColor, andSize size: CGSize) -> UIImage{
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color)
        let rectangle = CGRect(x: 0.0, y: 0.0, width: size.width, height: size.height)
        context?.fill(rectangle)
        let rectangleImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return rectangleImage ?? UIImage()
    }
}
