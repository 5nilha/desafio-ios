//
//  CoraTextField.swift
//
//
//  Created by Fabio Quintanilha on 11/03/24.
//

import UIKit

public class CoraTextFieldView: BaseView {

    internal let textField: UITextField = UITextField()
    private let iconView: UIImageView = UIImageView()

    weak var delegate: CoraTextFieldDelegate?

    public var icon: UIImage? {
        didSet {
            updateIconView()
        }
    }

    public var formatter: TextFieldFormatter = CoraTextFormatter(.regular) {
        didSet {
            textField.isSecureTextEntry = formatter.textFieldType.isSecureEntry
        }
    }

    public var placeholder: String? {
        didSet {
            textField.placeholder = placeholder
        }
    }

    public var fontSize: CGFloat = 22 {
        didSet {
            textField.font = CoraFonts.regular(ofSize: fontSize).font
        }
    }

    private let hStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    public convenience init(textFieldType: CoraTextFieldType = .regular, placeholder: String? = nil) {
        self.init(frame: .zero)
        self.formatter = CoraTextFormatter(textFieldType)
        self.textField.placeholder = placeholder
        self.placeholder = placeholder
    }

    internal func setupUI() {
        backgroundColor = .yellow
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(hStack)

        configureTextField()
        configureIconView()

        NSLayoutConstraint.activate([
            hStack.topAnchor.constraint(equalTo: topAnchor),
            hStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            hStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            hStack.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }

    private func configureTextField() {
        hStack.addArrangedSubview(textField)
        hStack.addArrangedSubview(iconView)
        textField.delegate = self
        textField.font = CoraFonts.regular(ofSize: fontSize).font
        textField.keyboardType = formatter.textFieldType.keyboardType
        textField.isSecureTextEntry = formatter.textFieldType.isSecureEntry
    }

    @objc private func iconViewTapped() {
        switch formatter.textFieldType {
        case .password:
            textField.isSecureTextEntry.toggle()
        default:
            break
        }
    }

    private func configureIconView() {
        iconView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(iconViewTapped))
        iconView.addGestureRecognizer(tapGesture)
    }

    private func updateIconView() {
        if let icon = icon {
            iconView.isHidden = false
            iconView.image = icon
        } else {
            iconView.isHidden = true
        }
    }
}

extension CoraTextFieldView: UITextFieldDelegate {

    public func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return formatter.decorate(text: &textField.text, inputString: string, position: range.location, rangeLength: range.length)
    }

    public func textFieldDidBeginEditing(_ textField: UITextField) {
        delegate?.textFieldDidBeginEditing?(textField)
    }

    public func textFieldDidEndEditing(_ textField: UITextField) {
        delegate?.textFieldDidEndEditing?(textField)
    }
}

public class CPFTextFieldView: CoraTextFieldView {

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.formatter = CoraTextFormatter(.cpf)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.formatter = CoraTextFormatter(.cpf)
    }

    public convenience init(placeholder: String = "000.000.000-00") {
        self.init(textFieldType: .cpf, placeholder: placeholder)
    }
}

public class PasswordTextFieldView: CoraTextFieldView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.formatter = CoraTextFormatter(.password)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.formatter = CoraTextFormatter(.password)
    }

    public convenience init(icon: UIImage, placeholder: String = "Enter password") {
        self.init(textFieldType: .password, placeholder: placeholder)
        self.icon = icon
    }

    override func setupUI() {
        super.setupUI()
    }
}
