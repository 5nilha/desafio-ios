//
//  File.swift
//  
//
//  Created by Fabio Quintanilha on 07/04/24.
//

import UIKit

public class CoraButton: BaseView {

    private let button: UIButton = UIButton()

    public var onClick: (() -> Void)?

    public var isActive: Bool = true {
        didSet {
            button.isEnabled = isActive
        }
    }

    public override var backgroundColor: UIColor?  {
        didSet {
            super.backgroundColor = .clear
            button.backgroundColor = backgroundColor
        }
    }

    public var buttonStyle: CoraButtonStyle = .regular() {
        didSet {
            button.titleLabel?.font = buttonStyle.font
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
        button.layer.cornerRadius = buttonStyle.cornerRadius
        button.clipsToBounds = true
        self.layer.cornerRadius = buttonStyle.cornerRadius
        self.clipsToBounds = true
    }

    private func configureButtonUI() {
        button.titleLabel?.font = buttonStyle.font
        button.contentHorizontalAlignment = .left
        setCorners()

        button.setTitleColor(buttonStyle.titleColor, for: .normal)
        button.setTitleColor(buttonStyle.disabledTitleColor, for: .disabled)

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
                button.backgroundColor = buttonStyle.backgoundColor
                button.tintColor = buttonStyle.titleColor

            case .disabled:
                button.backgroundColor = buttonStyle.disabledBackgroundColor
                button.tintColor = buttonStyle.disabledTitleColor

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
