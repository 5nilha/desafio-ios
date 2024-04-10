
#if canImport(UIKit)
import UIKit.UIColor
#endif

fileprivate protocol Theme {
    var primaryColor: UIColor { get }
    var secondaryColor: UIColor { get }
    var backgroundColor: UIColor { get }
    var accentColor: UIColor { get }
    var darkTextColor: UIColor { get }
    var grayTextColor: UIColor { get }
    var grayedOutColor: UIColor { get }
    var lightColor: UIColor { get }
}

public enum UITheme: Theme {

    case light
    case dark

    public var primaryColor: UIColor {
        return UIColor(hex: "#FE3E6D")
    }

    public var secondaryColor: UIColor {
        return .white
    }

    public var backgroundColor: UIColor {
        return .white
    }

    public var accentColor: UIColor {
        return UIColor(hex: "#1A93DA")
    }

    public var darkTextColor: UIColor {
        return UIColor(hex: "#3B3B3B")
    }

    public var grayTextColor: UIColor {
        return UIColor(hex: "#6B7076")
    }

    public var grayedOutColor: UIColor {
        return UIColor(hex: "#C7CBCF")
    }

    public var lightColor: UIColor {
        return UIColor(hex: "#F0F4F8")
    }
}


