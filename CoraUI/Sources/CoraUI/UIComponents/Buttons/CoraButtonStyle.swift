//
//  CoraButtonStyle.swift
//  
//
//  Created by Fabio Quintanilha on 07/04/24.
//

import UIKit

public enum CoraButtonStyle {
    case regular(theme: CoraButtonTheme = .primary, scale: CoraButtonScale = .medium)
    case link(theme: CoraButtonTheme = .primary, scale: CoraButtonScale = .medium)

    public var font: UIFont {
        switch self {
        case .regular(_, let scale), .link(_, let scale):
            return scale.font
        }
    }

    internal var titleColor: UIColor? {
        switch self {
        case .regular(let theme, _):
            return theme.titleColor
        case .link(let theme, _):
            return theme == .primary ? ThemeManager.current.primaryColor : ThemeManager.current.secondaryColor
        }
    }

    internal var disabledTitleColor: UIColor? {
        switch self {
        case .regular(let theme, _):
            return theme.disabledTitleColor
        case .link(let theme, _):
            return theme == .primary ? ThemeManager.current.primaryColor : ThemeManager.current.secondaryColor
        }
    }

    internal var backgoundColor: UIColor? {
        switch self {
        case .regular(let theme, _):
            return theme.backgoundColor
        case .link:
            return .clear
        }
    }

    internal var disabledBackgroundColor: UIColor? {
        switch self {
        case .regular(let theme, _):
            return theme.disabledBackgroundColor
        case .link:
            return .clear
        }
    }
}
