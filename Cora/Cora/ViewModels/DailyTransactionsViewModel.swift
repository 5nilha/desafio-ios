//
//  DailyTransactionsViewModel.swift
//  Cora
//
//  Created by Fabio Quintanilha on 11/04/24.
//

import Foundation

struct DailyTransactionsViewModel {

    let transactions: [TransactionViewModel]
    let date: String

    init(dailyTransactions: DailyTransactions) {
        self.transactions = dailyTransactions.items.map { TransactionViewModel(transaction: $0) }
        self.date = dailyTransactions.date.formatRelativeDate(formatType: .weekDay_day_month)
    }
}
