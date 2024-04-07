//
//  File.swift
//  
//
//  Created by Fabio Quintanilha on 07/04/24.
//

import UIKit.UIFont

public enum CoraButtonScale {
    case medium
    case large

    private var fontSize: CGFloat {
        switch self {
        case .medium: return 14
        case .large: return 16
        }
    }

    internal var font: UIFont {
        return CoraFonts.bold(ofSize: fontSize).font
    }
}
