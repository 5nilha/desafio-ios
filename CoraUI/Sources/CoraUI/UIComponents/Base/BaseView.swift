//
//  BaseView.swift
//  
//
//  Created by Fabio Quintanilha on 07/04/24.
//

import UIKit

public class BaseView: UIView {

    // MARK: - Initialization
    /// Initializes the BaseView with a frame.
    /// - Parameter frame: The initial frame for the base view.
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    /// Initializes the BaseView from data in a given unarchiver (coder).
    /// - Parameter coder: An unarchiver object.
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    /// Initializes the BaseView with a zero frame (convenience initializer).
    public convenience init() {
        self.init(frame: .zero)
    }

    /// Common initialization method called from various initializers.
    private func commonInit() {
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
