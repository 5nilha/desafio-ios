//
//  LoginProfileViewController.swift
//  Cora
//
//  Created by Fabio Quintanilha on 07/04/24.
//

import UIKit
import CoraUI

class LoginProfileViewController: BaseViewController {

    let headlineLabel: CoraLabel = {
        let label = CoraLabel(text: "Qual seu CPF?")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = ThemeManager.current.darkTextColor
        label.font = CoraFonts.bold(ofSize: 22).font
        return label
    }()

    let textLabel: CoraLabel = {
        let label = CoraLabel(text: "Bem-vindo de volta!")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = ThemeManager.current.grayTextColor
        label.font = CoraFonts.regular(ofSize: 16).font
        return label
    }()

    let textField: CPFTextFieldView = {
        let textFieldView = CPFTextFieldView(placeholder: "000.000.000-00")
        return textFieldView
    }()

    let primaryButton: CoraButton = {
        let button = CoraButton(title: "proximo", icon: UIImage(named: ImageAssets.arrowRight))
        button.buttonStyle = .regular(theme: .primary, scale: .medium)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        title = "Login Cora"
        view.addSubview(textLabel)
        view.addSubview(headlineLabel)
        view.addSubview(textField)
        view.addSubview(primaryButton)

        configureButton()

        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            headlineLabel.topAnchor.constraint(greaterThanOrEqualTo: textLabel.bottomAnchor, constant: 16),
            headlineLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            headlineLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            textField.topAnchor.constraint(greaterThanOrEqualTo: headlineLabel.bottomAnchor, constant: 32),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            textField.heightAnchor.constraint(equalToConstant: 50),

//            primaryButton.topAnchor.constraint(greaterThanOrEqualTo: textField.bottomAnchor, constant: 24),
            primaryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            primaryButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            primaryButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            primaryButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    private func configureButton() {
        primaryButton.onClick = { [weak self] in
            self?.delegate?.nextView()
        }
    }
}

extension LoginProfileViewController: CoraTextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        //Check CPF
    }
}
