//
//  CoraTransactionCardView.swift
//
//
//  Created by Fabio Quintanilha on 09/04/24.
//

import UIKit

public class CoraTransactionCardView: BaseView {

    private let transactionImageView = UIImageView()
    private let amountLabel = CoraLabel()
    private let descriptionLabel = UILabel()
    private let nameLabel = UILabel()
    private let timeLabel = UILabel()

    private var transaction: CoraUITransactionViewModeling?

    enum UIDimmensions {
        static let imageSize: CGFloat = 24
        static let paddings: CGFloat = 16
    }

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupViews()
    }

    convenience init(_ transaction: CoraUITransactionViewModeling? = nil) {
        self.init(frame: .zero)
        configure(with: transaction)
    }

    private func setupViews() {
        transactionImageView.contentMode = .scaleAspectFit
        transactionImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(transactionImageView)

        let vStack = UIStackView()
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.axis = .vertical
        addSubview(vStack)

        amountLabel.font = CoraFonts.bold(ofSize: 16).font
        amountLabel.textColor = ThemeManager.current.darkTextColor
        amountLabel.translatesAutoresizingMaskIntoConstraints = false
        vStack.addArrangedSubview(amountLabel)

        descriptionLabel.font = CoraFonts.regular(ofSize: 14).font
        descriptionLabel.textColor = ThemeManager.current.darkTextColor
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        vStack.addArrangedSubview(descriptionLabel)

        nameLabel.font = CoraFonts.regular(ofSize: 14).font
        nameLabel.textColor = ThemeManager.current.grayTextColor
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        vStack.addArrangedSubview(nameLabel)

        timeLabel.font = CoraFonts.regular(ofSize: 12).font
        timeLabel.textColor = ThemeManager.current.grayTextColor
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(timeLabel)

        NSLayoutConstraint.activate([
            transactionImageView.widthAnchor.constraint(equalToConstant: UIDimmensions.imageSize),
            transactionImageView.heightAnchor.constraint(equalTo: transactionImageView.widthAnchor),
            transactionImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            transactionImageView.topAnchor.constraint(equalTo: topAnchor),
            vStack.topAnchor.constraint(equalTo: topAnchor),
            vStack.bottomAnchor.constraint(equalTo: bottomAnchor),
            vStack.leadingAnchor.constraint(equalTo: transactionImageView.trailingAnchor, constant: UIDimmensions.paddings),
            timeLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            timeLabel.leadingAnchor.constraint(equalTo: vStack.trailingAnchor, constant: UIDimmensions.paddings),
            timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            timeLabel.widthAnchor.constraint(equalToConstant: 50)
        ])
    }

    public func configure(with transaction: CoraUITransactionViewModeling?) {
        self.transaction = transaction
        updateUI()
    }

    private func configureLabels() {
        guard let transaction = transaction else { return }

        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: transaction.amount)
        attributeString.addAttribute(
            NSAttributedString.Key.strikethroughStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: NSRange(location: 0, length: attributeString.length)
        )

        amountLabel.attributedText = attributeString
    }

    private func updateUI() {
        guard let transaction = transaction else { return }

        switch transaction.transactionType {
        case .income:
            amountLabel.textColor = ThemeManager.current.accentColor
            descriptionLabel.textColor = ThemeManager.current.accentColor
            amountLabel.attributeType = .regular
            transactionImageView.image = UIImage(named: transaction.imageName)?.withTintColor(ThemeManager.current.darkTextColor, renderingMode: .alwaysOriginal)
        case .deposit:
            amountLabel.textColor = ThemeManager.current.accentColor
            descriptionLabel.textColor = ThemeManager.current.accentColor
            amountLabel.attributeType = .regular
            transactionImageView.image = UIImage(named: transaction.imageName)?.withTintColor(ThemeManager.current.accentColor, renderingMode: .alwaysOriginal)
        case .returned:
            amountLabel.textColor = ThemeManager.current.darkTextColor
            descriptionLabel.textColor = ThemeManager.current.darkTextColor
            amountLabel.attributeType = .strikethrough
            transactionImageView.image = UIImage(named: transaction.imageName)?.withTintColor(ThemeManager.current.darkTextColor, renderingMode: .alwaysOriginal)
        case .outcome:
            amountLabel.textColor = ThemeManager.current.darkTextColor
            descriptionLabel.textColor = ThemeManager.current.darkTextColor
            amountLabel.attributeType = .regular
            transactionImageView.image = UIImage(named: transaction.imageName)?.withTintColor(ThemeManager.current.darkTextColor, renderingMode: .alwaysOriginal)
        }

        amountLabel.text = transaction.amount
        descriptionLabel.text = transaction.description
        nameLabel.text = transaction.name
        timeLabel.text = transaction.time
    }
}
