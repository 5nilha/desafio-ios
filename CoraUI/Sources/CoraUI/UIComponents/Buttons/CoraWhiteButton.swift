//
//  File.swift
//  
//
//  Created by Fabio Quintanilha on 07/04/24.
//

import Foundation

public class CoraWhiteButton: CoraButton {

    override var primaryTitleColor: UIColor? {
        return ThemeManager.current.primaryColor
    }

    override var disabledTitleColor: UIColor? {
        return ThemeManager.current.primaryColor
    }

    override var primaryBackgoundColor: UIColor? {
        return ThemeManager.current.secondaryColor
    }

    override var disabledBackgroundColor: UIColor? {
        return ThemeManager.current.secondaryColor
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
