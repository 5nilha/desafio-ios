//
//  TransactionsGroupViewModel.swift
//  Cora
//
//  Created by Fabio Quintanilha on 11/04/24.
//

import Foundation

struct TransactionsGroupViewModel {

    private var items: [DailyTransactionsViewModel] = []

    init() {
        let today = Date()
        let tomorrow = Calendar.current.date(byAdding: .day, value: 1, to: today)!
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: today)!
        let anotherDay = Calendar.current.date(byAdding: .day, value: -3, to: today)!

        let t1 = Transaction(id: "", description: "", label: "Pagamento recebido AME", entry: .credit, amount: 30, name: "Guy Edwards", dateEvent: today, status: "COMPLETED")
        let t2 = Transaction(id: "", description: "", label: "Pagamento recebido AME", entry: .credit, amount: 30, name: "Guy Edwards", dateEvent: yesterday, status: "COMPLETED")
        let t3 = Transaction(id: "", description: "", label: "Pagamento recebido AME", entry: .credit, amount: 30, name: "Guy Edwards", dateEvent: anotherDay, status: "COMPLETED")

        items = [
            DailyTransactionsViewModel(dailyTransactions: DailyTransactions(items: [t1], date: today)),
            DailyTransactionsViewModel(dailyTransactions: DailyTransactions(items: [t2], date: yesterday)),
            DailyTransactionsViewModel(dailyTransactions: DailyTransactions(items: [t3], date: anotherDay))
        ]
    }

    var titleHeight: CGFloat {
        return 32
    }

    func numOfSections() -> Int {
        return items.count
    }

    func titleForDailyTransactions(section: Int) -> String? {
        guard section < items.count else { return  nil }
        let dailyTransactions = items[section]
        return dailyTransactions.date
    }

    func numOfTransactions(section: Int) -> Int {
        guard section < items.count else { return  0 }
        let dailyTransactions = items[section]
        return dailyTransactions.transactions.count
    }

    func transactionAt(section: Int, index: Int) -> TransactionViewModel? {
        guard section < items.count else { return  nil }
        let dailyTransactions = items[section]

        guard index < dailyTransactions.transactions.count else { return nil }
        return dailyTransactions.transactions[index]
    }
}
