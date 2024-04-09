//
//  CoraTextFieldType.swift
//
//
//  Created by Fabio Quintanilha on 09/04/24.
//

import UIKit

public enum CoraTextFieldType {
    case regular
    case cpf
    case password

    public var maxLength: Int {
        switch self {
        case .cpf: return 13
        default: return 255
        }
    }

    var isSecureEntry: Bool {
        switch self {
        case .password: return true
        default: return false
        }
    }

    public var keyboardType: UIKeyboardType {
        switch self {
        case .cpf: return UIKeyboardType.numberPad
        default: return UIKeyboardType.default
        }
    }

    public func decorate(position: Int)  -> String? {
        switch self {
        case .cpf:
            return decorateCPF(position)
        default:
            return nil
        }
    }

    private func decorateCPF(_ position: Int)  -> String {
        var string = ""

        switch position {
        case 3:
            string = "."
        case 7:
            string = "."
        case 11:
            string = "-"
        default:
            break
        }
        return string
    }
}
