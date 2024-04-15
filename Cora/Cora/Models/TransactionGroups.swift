//
//  TransactionGroups.swift
//  Cora
//
//  Created by Fabio Quintanilha on 11/04/24.
//

import Foundation

struct TransactionGroups: Codable {
    let results: [DailyTransactions]
    let itemsTotal: Int
}
