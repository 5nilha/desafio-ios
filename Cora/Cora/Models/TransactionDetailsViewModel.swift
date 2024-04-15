//
//  TransactionDetailsViewModel.swift
//  Cora
//
//  Created by Fabio Quintanilha on 11/04/24.
//

import Foundation
import CoraUI

class TransactionDetailsViewModel: ViewModeling {
    private var transactionDetail: TransactionDetail?

    var onLoadData: (() -> Void)?

    var imageName: String {
        return ImageAssets.incomeTransaction
    }

    var label: String? {
        return transactionDetail?.label
    }

    var amount: String {
        guard let amount = transactionDetail?.amount else { return ""}
        return "\(amount)"
    }

    var date: String? {
        return transactionDetail?.dateEvent.formatRelativeDate(formatType: .weekDay_day_month_year)
    }

    var recipientName: String? {
        return transactionDetail?.recipient.name
    }

    var recipientInfo: String? {
        guard let transactionDetail = self.transactionDetail else { return nil }
        return """
        \(transactionDetail.recipient.documentType) \(transactionDetail.recipient.documentNumber)
        \(transactionDetail.recipient.bankName)
         Agência \(transactionDetail.recipient.accountNumber) - Conta \(transactionDetail.recipient.accountNumber)-\(transactionDetail.recipient.accountNumberDigit)
        """
    }

    var senderName: String? {
        return transactionDetail?.sender.name
    }

    var senderInfo: String? {
        guard let transactionDetail = self.transactionDetail else { return nil }
        return """
        \(transactionDetail.sender.documentType) \(transactionDetail.sender.documentNumber)
        \(transactionDetail.sender.bankName)
         Agência \(transactionDetail.sender.accountNumber) - Conta \(transactionDetail.sender.accountNumber)-\(transactionDetail.sender.accountNumberDigit)
        """
    }

    var description: String? {
        return transactionDetail?.description
    }

    func loadData() {
        let recipient = TransactionParty(bankName: "Banco XYZ",
                                         bankNumber: "001",
                                         documentNumber: "11223344000155",
                                         documentType: "CNPJ",
                                         accountNumberDigit: "9",
                                         agencyNumberDigit: "7",
                                         agencyNumber: "1234",
                                         name: "Empresa ABC LTDA",
                                         accountNumber: "987654")
        self.transactionDetail = TransactionDetail(id: "123",
                                                   description: "Developed by the Intel Corporation, HDCP stands for high-bandwidth digital content protection. As the descriptive name implies.", 
                                                   label: "Pagamento recebido",
                                                   amount: 30,
                                                   counterPartyName: "Empresa ABC LTDA",
                                                   dateEvent: Date(),
                                                   recipient: recipient, sender: recipient, status: "COMPLETED")
        onLoadData?()
    }
}
