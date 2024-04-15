//
//  TransactionViewModel.swift
//  Cora
//
//  Created by Fabio Quintanilha on 09/04/24.
//

import CoraUI

struct TransactionViewModel: CoraUITransactionViewModeling {
    
    let transaction: Transaction

    init(transaction: Transaction) {
        self.transaction = transaction
    }
    
    var id: String {
        return transaction.id
    }

    var imageName: String  {
        return ""
    }

    var amount: String {
        return "\(transaction.amount)"
    }

    var description: String {
        return transaction.label
    }

    var name: String {
        return transaction.name
    }

    var time: String {
        return transaction.dateEvent.formatToHoursAndMinutes()
    }

    var transactionType: CoraUITransactionViewType {
        switch transaction.entry {
        case .credit:
            return .income
        case .debit:
            return .outcome
        }
    }
}
