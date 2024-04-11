//
//  HomeViewController.swift
//  Cora
//
//  Created by Fabio Quintanilha on 07/04/24.
//

import UIKit
import CoraUI

class HomeViewController: BaseViewController {

    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: ImageAssets.logo)
        return imageView
    }()

    let homeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: ImageAssets.homeImage)
        return imageView
    }()

    let headlineLabel: CoraLabel = {
        let label = CoraLabel(text: "Conta Digital PJ\nPoderosamente simples")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = ThemeManager.current.secondaryColor
        label.font = CoraFonts.bold(ofSize: 28).font
        return label
    }()

    let textLabel: CoraLabel = {
        let label = CoraLabel(text: "Sua empresa livre burocracias e de taxas para gerar boletos, fazer transferências e pagamentos.")
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = ThemeManager.current.secondaryColor
        label.font = CoraFonts.regular(ofSize: 16).font
        return label
    }()

    let primaryButton: CoraButton = {
        let button = CoraButton(title: "Quero fazer parte!", icon: UIImage(named: ImageAssets.arrowRight))
        button.buttonStyle = .regular(theme: .secondary, scale: .large)
        return button
    }()

    let secondaryButton: CoraButton = {
        let button = CoraButton(title: "Já sou cliente")
        button.buttonStyle = .regular(theme: .primary, scale: .medium)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func stylePresentation() {
        super.stylePresentation()
        view.backgroundColor = ThemeManager.current.primaryColor
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    private func setupUI() {
        view.addSubview(homeImageView)
        view.addSubview(logoImageView)
        view.addSubview(headlineLabel)
        view.addSubview(textLabel)
        view.addSubview(primaryButton)
        view.addSubview(secondaryButton)

        configureButtons()

        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 24),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            logoImageView.widthAnchor.constraint(equalToConstant: 90),
            logoImageView.heightAnchor.constraint(equalToConstant: 22.5),

            homeImageView.topAnchor.constraint(equalTo: view.topAnchor),
            homeImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeImageView.widthAnchor.constraint(equalToConstant: view.frame.width),

            headlineLabel.topAnchor.constraint(greaterThanOrEqualTo: homeImageView.bottomAnchor, constant: 16),
            headlineLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            headlineLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            textLabel.topAnchor.constraint(equalTo: headlineLabel.bottomAnchor, constant: 16),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),

            primaryButton.topAnchor.constraint(greaterThanOrEqualTo: textLabel.bottomAnchor, constant: 24),
            primaryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            primaryButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            primaryButton.heightAnchor.constraint(equalToConstant: 64),

            secondaryButton.topAnchor.constraint(equalTo: primaryButton.bottomAnchor, constant: 16),
            secondaryButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            secondaryButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            secondaryButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            secondaryButton.heightAnchor.constraint(equalToConstant: 48)
        ])
    }

    private func configureButtons() {
        primaryButton.onClick = { [weak self] in
            self?.delegate?.nextView()
        }

        secondaryButton.onClick = {
            //Unimplemented
        }
    }
}
