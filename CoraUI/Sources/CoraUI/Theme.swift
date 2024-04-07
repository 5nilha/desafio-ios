
#if canImport(UIKit)
import UIKit
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
        return UIColor(red: 1.00, green: 0.24, blue: 0.43, alpha: 1.00)
    }

    public var secondaryColor: UIColor {
        return .white
    }

    public var backgroundColor: UIColor {
        return .white
    }

    public var accentColor: UIColor {
        return UIColor(red: 0.10, green: 0.58, blue: 0.85, alpha: 1.00)
    }

    public var darkTextColor: UIColor {
        return UIColor(red: 0.23, green: 0.23, blue: 0.23, alpha: 1.00)
    }

    public var grayTextColor: UIColor {
        return UIColor(red: 0.42, green: 0.44, blue: 0.46, alpha: 1.00)
    }

    public var grayedOutColor: UIColor {
        return UIColor(red: 0.78, green: 0.80, blue: 0.81, alpha: 1.00)
    }

    public var lightColor: UIColor {
        return UIColor(red: 0.94, green: 0.96, blue: 0.97, alpha: 1.00)
    }
}
