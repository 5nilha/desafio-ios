//
//  TransactionDetailsViewController.swift
//  Cora
//
//  Created by Fabio Quintanilha on 07/04/24.
//

import UIKit
import CoraUI

class TransactionDetailsViewController: BaseViewController {

    let scrollView = UIScrollView()
    let primaryButton: CoraButton = CoraButton(title: "Compartilhar comprovante")

    let contentView: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 24
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        title = "Detalhes da transferência"
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false

        scrollView.contentSize = CGSize(width: view.frame.width, height: contentView.frame.origin.y + contentView.frame.size.height + primaryButton.frame.size.height + 48)

        let titleStack = buildTitleStack(icon: UIImage(named: ImageAssets.outcomeTransaction), title: "Transferencia enviada")
        contentView.addArrangedSubview(titleStack)

        let transactionValueStack = buildTransactionValueStack(title: "Valor", value: "R$ 154,00")
        contentView.addArrangedSubview(transactionValueStack)

        let dateStack = buildDateStack(title: "Data", date: "Hoje - 12/10/2019")
        contentView.addArrangedSubview(dateStack)

        let transactionInfo1 = buildTransferInfoStack(title: "De", subject: "Dev iOS", info: """
        CPF 123.456.789-10
        Banco Cora
        Agência 1234 - Conta 12345-6
        """)
        contentView.addArrangedSubview(transactionInfo1)

        let transactionInfo2 = buildTransferInfoStack(title: "Para", subject: "Dev iOS", info: """
        CPF 123.456.789-10
        Banco Cora
        Agência 1234 - Conta 12345-6
        """)
        contentView.addArrangedSubview(transactionInfo2)

        let descriptionStack = buildDescriptionStack(title: "Descrição", description: "Developed by the Intel Corporation, HDCP stands for high-bandwidth digital content protection. As the descriptive name implies.")
        contentView.addArrangedSubview(descriptionStack)

        setupButton()

        NSLayoutConstraint.activate([
                scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

                contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 32),
                contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
                contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
                contentView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -(24 * 2))
            ])
    }

    func buildStack(components: [UIView], axis: NSLayoutConstraint.Axis = .vertical, spacing: CGFloat = 4) -> UIStackView {
        let stack = UIStackView()
        stack.axis = axis
        stack.spacing = spacing

        components.forEach { stack.addArrangedSubview($0) }
        return stack
    }

    func buildTransactionValueStack(title: String, value: String) -> UIStackView {
        let titleLabel: UILabel = UILabel()
        titleLabel.text = title
        titleLabel.font = CoraFonts.regular(ofSize: 14).font
        titleLabel.textColor = ThemeManager.current.darkTextColor

        let valueLabel: UILabel = UILabel()
        valueLabel.text = value
        valueLabel.font = CoraFonts.bold(ofSize: 16).font
        valueLabel.textColor = ThemeManager.current.darkTextColor
        valueLabel.numberOfLines = 0

        return buildStack(components: [titleLabel, valueLabel])
    }

    func buildDateStack(title: String, date: String) -> UIStackView {
        let titleLabel: UILabel = UILabel()
        titleLabel.text = title
        titleLabel.font = CoraFonts.regular(ofSize: 14).font
        titleLabel.textColor = ThemeManager.current.darkTextColor

        let dateLabel: UILabel = UILabel()
        dateLabel.text = date
        dateLabel.font = CoraFonts.bold(ofSize: 16).font
        dateLabel.textColor = ThemeManager.current.darkTextColor
        dateLabel.numberOfLines = 0

        return buildStack(components: [titleLabel, dateLabel])
    }

    func buildTitleStack(icon: UIImage? = nil, title: String) -> UIStackView {
        let iconView = UIImageView()
        iconView.translatesAutoresizingMaskIntoConstraints = false
        iconView.contentMode = .scaleAspectFit
        iconView.image = icon

        iconView.widthAnchor.constraint(equalToConstant: 24).isActive = true
        iconView.heightAnchor.constraint(equalTo: iconView.heightAnchor).isActive = true

        let label = CoraLabel(text: title)
        label.font = CoraFonts.bold(ofSize: 16).font

        return buildStack(components: [iconView, label], axis: .horizontal, spacing: 8)
    }

    func buildTransferInfoStack(title: String, subject: String, info: String) -> UIStackView {
        let titleLabel: UILabel = UILabel()
        titleLabel.text = title
        titleLabel.font = CoraFonts.regular(ofSize: 14).font
        titleLabel.textColor = ThemeManager.current.darkTextColor

        let subjectLabel: UILabel = UILabel()
        subjectLabel.text = subject
        subjectLabel.font = CoraFonts.bold(ofSize: 16).font
        subjectLabel.textColor = ThemeManager.current.darkTextColor
        subjectLabel.numberOfLines = 0

        let infoLabel: UILabel = UILabel()
        infoLabel.text = info
        infoLabel.font = CoraFonts.regular(ofSize: 14).font
        infoLabel.textColor = ThemeManager.current.grayTextColor
        infoLabel.numberOfLines = 0

        return buildStack(components: [titleLabel, subjectLabel, infoLabel])
    }

    func buildDescriptionStack(title: String, description: String) -> UIStackView {
        let descriptionTitleLabel: UILabel = UILabel()
        descriptionTitleLabel.text = title
        descriptionTitleLabel.font = CoraFonts.regular(ofSize: 14).font
        descriptionTitleLabel.textColor = ThemeManager.current.darkTextColor

        let descriptionLabel: UILabel = UILabel()
        descriptionLabel.text = description
        descriptionLabel.font = CoraFonts.regular(ofSize: 14).font
        descriptionLabel.textColor = ThemeManager.current.grayTextColor
        descriptionLabel.numberOfLines = 0

        return buildStack(components: [descriptionTitleLabel, descriptionLabel])
    }

    func setupButton() {

        primaryButton.buttonStyle = .regular(theme: .primary, scale: .large)

        NSLayoutConstraint.activate([
            primaryButton.heightAnchor.constraint(equalToConstant: 64)
        ])

        let spacerView = UIView()
        spacerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            spacerView.heightAnchor.constraint(equalToConstant: 30)
        ])
        contentView.addArrangedSubview(spacerView)
        contentView.addArrangedSubview(primaryButton)
    }
}
