//
//  File.swift
//  
//
//  Created by Fabio Quintanilha on 07/04/24.
//

import UIKit.UIButton

public enum CoraButtonScale {
    case meddium
    case large

    var font: UIFont {
        return CoraFonts.bold(ofSize: self == .meddium ? 14 : 16).font
    }
}

public class CoraButton: UIButton {

    public var corner: CGFloat = 16 {
        didSet {
            self.layer.cornerRadius = corner
        }
    }

    public var buttonScale: CoraButtonScale = .meddium {
        didSet {
            self.titleLabel?.font = buttonScale.font
        }
    }

    public var icon: UIImage? {
        didSet {
            guard let icon else { return }
            self.setImage(icon, for: .normal)
        }
    }

    // Initialization of the button
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    // For using the button in Interface Builder
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }

    public convenience init(title: String = "cora_button_title") {
        self.init(frame: .zero)
        self.setTitle(title, for: .normal)
    }

    // Setting up the button's appearance and accessibility
    private func setupButton() {
        translatesAutoresizingMaskIntoConstraints = false

        // Set the button's background color
        self.backgroundColor = ThemeManager.current.primaryColor

        // Set the button's title color
        self.setTitleColor(ThemeManager.current.secondaryColor, for: .normal)

        // Set the button's font
        self.titleLabel?.font = buttonScale.font

        // Make the button's corners rounded
        self.layer.cornerRadius = corner

        // Adjust the image position (right side) and title (left side)
        self.semanticContentAttribute = .forceRightToLeft
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)

        // Accessibility settings
        self.isAccessibilityElement = true
        self.accessibilityLabel = "\(self.title(for: .normal) ?? "")"
        self.accessibilityHint = "Dê dois toques para continuar"
        self.accessibilityTraits = .button

        // Accessibility identifier for UI testing
        self.accessibilityIdentifier = "coraButton"
    }

    // To ensure that the button's content scales properly
    public override var intrinsicContentSize: CGSize {
        let labelSize = titleLabel?.intrinsicContentSize ?? .zero
        let imageSize = imageView?.intrinsicContentSize ?? .zero
        let width = labelSize.width + imageSize.width + 32
        let height = max(labelSize.height, imageSize.height) + 16
        return CGSize(width: width, height: height)
    }
}
