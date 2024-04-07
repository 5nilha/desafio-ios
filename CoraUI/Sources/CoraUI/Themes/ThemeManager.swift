//
//  File.swift
//  
//
//  Created by Fabio Quintanilha on 06/04/24.
//

import Foundation

public class ThemeManager {

    private init() {}

    public private (set) static var current: UITheme = .light

    public class func applyTheme(theme: UITheme) {
        self.current = theme
    }
}
