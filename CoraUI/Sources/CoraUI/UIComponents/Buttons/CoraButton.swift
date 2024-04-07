//
//  File.swift
//  
//
//  Created by Fabio Quintanilha on 07/04/24.
//

import UIKit

public enum CoraButtonScale {
    case medium
    case large

    var font: UIFont {
        return CoraFonts.bold(ofSize: self == .medium ? 14 : 16).font
    }
}

public class CoraButton: BaseView {

    private let button: UIButton = UIButton()

    public var onClick: (() -> Void)?

    public var isActive: Bool = true {
        didSet {
            button.isEnabled = isActive
        }
    }

    public var cornerRadius: CGFloat = 12 {
        didSet {
            setCorners()
        }
    }

    public var buttonScale: CoraButtonScale = .medium {
        didSet {
            button.titleLabel?.font = buttonScale.font
        }
    }

    public var icon: UIImage? {
        didSet {
            button.setImage(icon, for: .normal)
        }
    }

    // Initialization of the button
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setView()
    }

    // For using the button in Interface Builder
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setView()
    }

    public convenience init(title: String, icon: UIImage? = nil, onClick: (() -> Void)? = nil) {
        self.init(frame: .zero)
        button.setTitle(title, for: .normal)
        self.icon = icon
    }

    private func setView() {
        button.translatesAutoresizingMaskIntoConstraints = false
        addSubview(button)
        setupButton()

        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: topAnchor),
            button.bottomAnchor.constraint(equalTo: bottomAnchor),
            button.leadingAnchor.constraint(equalTo: leadingAnchor),
            button.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    private func setupButton() {
        configureButtonUI()
        updateButtonUIStates()
        setupAccessibility()
    }

    private func setCorners() {
        button.layer.cornerRadius = cornerRadius
        button.clipsToBounds = true
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }

    private func configureButtonUI() {
        button.titleLabel?.font = buttonScale.font
        button.contentHorizontalAlignment = .left
        setCorners()

        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = ThemeManager.current.primaryColor
        config.baseForegroundColor = ThemeManager.current.secondaryColor
        config.image = icon
        config.titleAlignment = .center
        config.imagePlacement = .trailing
        config.imagePadding = 8
        config.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16)
        button.configuration = config
    }

    private func updateButtonUIStates() {
        button.configurationUpdateHandler = { [weak self] button in
            guard let self = self else { return }

            switch button.state {
            case .normal:
                button.configuration?.baseBackgroundColor = ThemeManager.current.primaryColor
                button.configuration?.baseForegroundColor = ThemeManager.current.secondaryColor

            case .disabled:
                button.configuration?.baseBackgroundColor = ThemeManager.current.grayedOutColor
                button.configuration?.baseForegroundColor = ThemeManager.current.secondaryColor

            default:
                break
            }

            // The title font needs to be updated only if it has changed.
            if button.titleLabel?.font != self.buttonScale.font {
                button.titleLabel?.font = self.buttonScale.font
            }
        }
    }

    private func setButtonAction() {
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }

    @objc private func buttonAction() {
        onClick?()
    }

    private func setupAccessibility() {
        self.isAccessibilityElement = true
        self.accessibilityLabel = "\(button.title(for: .normal) ?? "")"
        self.accessibilityHint = "Dê dois toques para continuar"
        self.accessibilityTraits = .button
        self.accessibilityIdentifier = "coraButton"
    }
}
