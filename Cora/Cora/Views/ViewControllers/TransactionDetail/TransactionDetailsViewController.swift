//
//  TransactionDetailsViewController.swift
//  Cora
//
//  Created by Fabio Quintanilha on 07/04/24.
//

import UIKit
import CoraUI

class TransactionDetailsViewController: BaseViewController {

    let transactionDetailsViewModel = TransactionDetailsViewModel()
    
    //MARK: UI Components

    let scrollView = UIScrollView()
    let primaryButton: CoraButton = CoraButton(title: "Compartilhar comprovante")

    let contentView: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 24
        return stack
    }()

    let iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    let titleLabel: CoraLabel = {
        let label = CoraLabel()
        label.font = CoraFonts.bold(ofSize: 16).font
        return label
    }()

    let amountTitleLabel: CoraLabel = {
        let label = CoraLabel(text: "Valor")
        label.font = CoraFonts.regular(ofSize: 14).font
        label.textColor = ThemeManager.current.darkTextColor
        return label
    }()

    let amountTextLabel: CoraLabel = {
        let label = CoraLabel()
        label.font = CoraFonts.bold(ofSize: 16).font
        label.textColor = ThemeManager.current.darkTextColor
        label.numberOfLines = 0
        return label
    }()

    let dateTitleLabel: CoraLabel = {
        let label = CoraLabel(text: "Data")
        label.font = CoraFonts.regular(ofSize: 14).font
        label.textColor = ThemeManager.current.darkTextColor
        return label
    }()

    let dateTextLabel: CoraLabel = {
        let label = CoraLabel()
        label.font = CoraFonts.bold(ofSize: 16).font
        label.textColor = ThemeManager.current.darkTextColor
        label.numberOfLines = 0
        return label
    }()

    let recipientTitle: CoraLabel = {
        let label = CoraLabel(text: "De")
        label.font = CoraFonts.regular(ofSize: 14).font
        label.textColor = ThemeManager.current.darkTextColor
        return label
    }()


    let recipientNameLabel: CoraLabel = {
        let label = CoraLabel()
        label.font = CoraFonts.bold(ofSize: 16).font
        label.textColor = ThemeManager.current.darkTextColor
        label.numberOfLines = 0
        return label
    }()

    let recipientInfoLabel: CoraLabel = {
        let label = CoraLabel()
        label.font = CoraFonts.regular(ofSize: 14).font
        label.textColor = ThemeManager.current.grayTextColor
        label.numberOfLines = 0
        return label
    }()

    let senderTitle: CoraLabel = {
        let label = CoraLabel(text: "Para")
        label.font = CoraFonts.regular(ofSize: 14).font
        label.textColor = ThemeManager.current.darkTextColor
        return label
    }()

    let senderNameLabel: CoraLabel = {
        let label = CoraLabel()
        label.font = CoraFonts.bold(ofSize: 16).font
        label.textColor = ThemeManager.current.darkTextColor
        label.numberOfLines = 0
        return label
    }()

    let senderInfoLabel: CoraLabel = {
        let label = CoraLabel()
        label.font = CoraFonts.regular(ofSize: 14).font
        label.textColor = ThemeManager.current.grayTextColor
        label.numberOfLines = 0
        return label
    }()

    let descriptionTitleLabel: CoraLabel = {
        let label = CoraLabel(text: "Descrição")
        label.font = CoraFonts.regular(ofSize: 14).font
        label.textColor = ThemeManager.current.darkTextColor
        return label
    }()

    let descriptionTextLabel: CoraLabel = {
        let label = CoraLabel()
        label.font = CoraFonts.regular(ofSize: 14).font
        label.textColor = ThemeManager.current.grayTextColor
        label.numberOfLines = 0
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()

        transactionDetailsViewModel.onLoadData = { [weak self] in
            self?.updateUI()
        }
        transactionDetailsViewModel.loadData()
    }

    func setupUI() {
        title = "Detalhes da transferência"
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize = CGSize(width: view.frame.width, height: contentView.frame.origin.y + contentView.frame.size.height + primaryButton.frame.size.height + 48)

        contentView.addArrangedSubview(buildStack(components: [iconView, titleLabel], axis: .horizontal, spacing: 8))
        contentView.addArrangedSubview(buildStack(components: [amountTitleLabel, amountTextLabel]))
        contentView.addArrangedSubview(buildStack(components: [dateTitleLabel, dateTextLabel]))
        contentView.addArrangedSubview(buildStack(components: [recipientTitle, recipientNameLabel, recipientInfoLabel]))
        contentView.addArrangedSubview(buildStack(components: [senderTitle, senderNameLabel, senderInfoLabel]))
        contentView.addArrangedSubview(buildStack(components: [descriptionTitleLabel, descriptionTextLabel]))
        setupButton()

        NSLayoutConstraint.activate([
                scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

                contentView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 32),
                contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 24),
                contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -24),
                contentView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -(24 * 2)),

                iconView.widthAnchor.constraint(equalToConstant: 24),
                iconView.heightAnchor.constraint(equalTo: iconView.heightAnchor)
            ])
    }

    func buildStack(components: [UIView], axis: NSLayoutConstraint.Axis = .vertical, spacing: CGFloat = 4) -> UIStackView {
        let stack = UIStackView()
        stack.axis = axis
        stack.spacing = spacing

        components.forEach { stack.addArrangedSubview($0) }
        return stack
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

    private func updateUI() {
        iconView.image = UIImage(named: transactionDetailsViewModel.imageName)
        titleLabel.text = transactionDetailsViewModel.label

        amountTextLabel.text = transactionDetailsViewModel.amount
        dateTextLabel.text = transactionDetailsViewModel.date

        recipientNameLabel.text = transactionDetailsViewModel.recipientName
        recipientInfoLabel.text = transactionDetailsViewModel.recipientInfo

        senderNameLabel.text = transactionDetailsViewModel.senderName
        senderInfoLabel.text = transactionDetailsViewModel.senderInfo

        descriptionTextLabel.text = transactionDetailsViewModel.description
    }
}
