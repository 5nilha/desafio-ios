//
//  CoraButtonTheme.swift
//  
//
//  Created by Fabio Quintanilha on 07/04/24.
//

import UIKit.UIColor

public enum CoraButtonTheme {
    case primary
    case secondary

    internal var titleColor: UIColor? {
        switch self {
        case .primary: return ThemeManager.current.secondaryColor
        case .secondary: return ThemeManager.current.primaryColor
        }
    }

    internal var disabledTitleColor: UIColor? {
        switch self {
        case .primary: return ThemeManager.current.secondaryColor
        case .secondary: return ThemeManager.current.primaryColor
        }
    }

    internal var backgoundColor: UIColor? {
        switch self {
        case .primary: 
            return ThemeManager.current.primaryColor
        case .secondary: 
            return ThemeManager.current.secondaryColor
        }
    }

    internal var disabledBackgroundColor: UIColor? {
        switch self {
        case .primary: return ThemeManager.current.grayedOutColor
        case .secondary: return ThemeManager.current.secondaryColor
        }
    }
}
