//
//  TextFieldFormatter.swift
//
//
//  Created by Fabio Quintanilha on 09/04/24.
//

import Foundation

public protocol TextFieldFormatter {
    var textFieldType: CoraTextFieldType { get set }
    var rawValue: String { get }
    var maxLength: Int { get }
    func decorate(text: inout String?, inputString: String, position: Int, rangeLength: Int) -> Bool
}
