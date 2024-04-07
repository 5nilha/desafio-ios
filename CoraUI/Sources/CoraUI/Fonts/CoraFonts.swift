//
//  File.swift
//  
//
//  Created by Fabio Quintanilha on 07/04/24.
//

import UIKit.UIFont

public enum CoraFonts {
    case regular(ofSize: CGFloat)
    case bold(ofSize: CGFloat)

    private var named: String {
        switch self {
        case .regular: return "Avenir-Book"
        case .bold: return "Avenir-Heavy"
        }
    }

    public var font: UIFont {
        switch self {
        case .regular(let size):
            return buildFont(ofSize: size, weight: .regular)
        case .bold(let size):
            return buildFont(ofSize: size, weight: .heavy)
        }
    }

    private func buildFont(ofSize size: CGFloat, weight: UIFont.Weight) -> UIFont {
        if let font = UIFont(name: self.named, size: size) {
            return font
        } else {
            return UIFont.systemFont(ofSize: size, weight: weight)
        }
    }
}
