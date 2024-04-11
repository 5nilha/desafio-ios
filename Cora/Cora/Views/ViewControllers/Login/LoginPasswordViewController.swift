//
//  LoginPasswordViewController.swift
//  Cora
//
//  Created by Fabio Quintanilha on 07/04/24.
//

import UIKit
import CoraUI

class LoginPasswordViewController: BaseViewController {

    let headlineLabel: CoraLabel = {
        let label = CoraLabel(text: "Digite sua senha de acesso")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = ThemeManager.current.darkTextColor
        label.font = CoraFonts.bold(ofSize: 22).font
        return label
    }()


    let textField: PasswordTextFieldView = {
        let textFieldView = PasswordTextFieldView(placeholder: "********")
        return textFieldView
    }()

    let primaryButton: CoraButton = {
        let button = CoraButton(title: "proximo", icon: UIImage(named: ImageAssets.arrowRight))
        button.buttonStyle = .regular(theme: .primary, scale: .medium)
        return button
    }()

    let linkButton: CoraButton = {
        let button = CoraButton(title: "Esqueci minha senha")
        button.buttonStyle = .link(theme: .primary, scale: .medium)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        title = "Login Cora"
        view.addSubview(headlineLabel)
        view.addSubview(textField)
        view.addSubview(linkButton)
        view.addSubview(primaryButton)

        configureButtons()

        NSLayoutConstraint.activate([
            headlineLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            headlineLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            headlineLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            textField.topAnchor.constraint(greaterThanOrEqualTo: headlineLabel.bottomAnchor, constant: 32),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            textField.heightAnchor.constraint(equalToConstant: 50),

            linkButton.topAnchor.constraint(greaterThanOrEqualTo: textField.bottomAnchor, constant: 48),
            linkButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24 - linkButton.paddingLeft),
            linkButton.heightAnchor.constraint(equalToConstant: 48),

//            primaryButton.topAnchor.constraint(equalTo: primaryButton.bottomAnchor, constant: 16),
            primaryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            primaryButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            primaryButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            primaryButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    private func configureButtons() {
        primaryButton.onClick = { [weak self] in
            self?.delegate?.nextView()
        }

        linkButton.onClick = {
            //Uniplemented
        }
    }
}

extension LoginPasswordViewController: CoraTextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        //Check Password
    }
}
