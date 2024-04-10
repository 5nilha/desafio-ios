//
//  TransactionTableViewCell.swift
//  Cora
//
//  Created by Fabio Quintanilha on 09/04/24.
//

import UIKit
import CoraUI

class TransactionTableViewCell: UITableViewCell {
    static let identifier: String = "TransactionCell"

    let transactionCardView: CoraTransactionCardView = CoraTransactionCardView()

    enum UIDimensions {
        static let sideMargin: CGFloat = 24
        static let topMargin: CGFloat = 15
        static let bottomMargin: CGFloat = 10
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        contentView.addSubview(transactionCardView)

        NSLayoutConstraint.activate([
            transactionCardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: UIDimensions.topMargin),
            transactionCardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -UIDimensions.bottomMargin),
            transactionCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: UIDimensions.sideMargin),
            transactionCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -UIDimensions.sideMargin)
        ])
    }

    func configure(with transaction: CoraUITransactionViewModeling) {
        transactionCardView.configure(with: transaction)
    }
}
