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

    internal var primaryTitleColor: UIColor? {
        return ThemeManager.current.secondaryColor
    }

    internal var disabledTitleColor: UIColor? {
        return ThemeManager.current.secondaryColor
    }

    internal var primaryBackgoundColor: UIColor? {
        return ThemeManager.current.primaryColor
    }

    internal var disabledBackgroundColor: UIColor? {
        return ThemeManager.current.grayedOutColor
    }

    public var onClick: (() -> Void)?

    public var isActive: Bool = true {
        didSet {
            self.backgroundColor
            button.isEnabled = isActive
        }
    }

    public override var backgroundColor: UIColor?  {
        didSet {
            super.backgroundColor = .clear
            button.backgroundColor = backgroundColor
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
            button.configuration?.image = icon
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
        self.icon = icon
        button.setTitle(title, for: .normal)
        button.configuration?.image = icon
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
        setButtonAction()
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

        button.setTitleColor(primaryTitleColor, for: .normal)
        button.setTitleColor(disabledTitleColor, for: .disabled)

        var config = UIButton.Configuration.filled()
        config.baseBackgroundColor = ThemeManager.current.primaryColor
//        config.baseForegroundColor = ThemeManager.current.secondaryColor
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
                button.backgroundColor = primaryBackgoundColor
                button.tintColor = primaryTitleColor

            case .disabled:
                button.backgroundColor = disabledBackgroundColor
                button.tintColor = disabledTitleColor

            default:
                break
            }
        }
    }

    private func setButtonAction() {
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }

    @objc private func buttonAction() {
        isActive = false
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
