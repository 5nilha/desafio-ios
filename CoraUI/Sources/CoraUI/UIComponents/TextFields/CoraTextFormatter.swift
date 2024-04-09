//
//  File.swift
//  
//
//  Created by Fabio Quintanilha on 09/04/24.
//

import Foundation

class CoraTextFormatter: TextFieldFormatter {

    var textFieldType: CoraTextFieldType
    private (set) var rawValue: String = ""

    init(_ textFieldType: CoraTextFieldType = .cpf) {
        self.textFieldType = textFieldType
    }

    public var maxLength: Int {
        return textFieldType.maxLength
    }

    public func decorate(text: inout String?, inputString: String, position: Int, rangeLength: Int) -> Bool {
        if  inputString == "" && (text?.count ?? 0) > 0 {
            rawValue.removeLast()
        } else {
            rawValue.append(inputString)
        }

        if rangeLength == 0, let decoratedString  = textFieldType.decorate(position: position) {
            text?.append(decoratedString)
        }
        guard let textCount = text?.count,  textCount > maxLength, rangeLength == 0 else {
            return true
        }

         return false
    }
}
