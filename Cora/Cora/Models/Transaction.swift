//
//  Transaction.swift
//  Cora
//
//  Created by Fabio Quintanilha on 11/04/24.
//

import Foundation

struct Transaction: Codable {
    let id: String
    let description: String
    let label: String
    let entry: TransactionEntryType
    let amount: Int
    let name: String
    let dateEvent: Date
    let status: String

    init(id: String, description: String, label: String, entry: TransactionEntryType, amount: Int, name: String, dateEvent: Date, status: String) {
        self.id = id
        self.description = description
        self.label = label
        self.entry = entry
        self.amount = amount
        self.name = name
        self.dateEvent = dateEvent
        self.status = status
    }
}

enum TransactionEntryType: String, Codable {
    case debit = "DEBIT"
    case credit = "CREDIT"
}
