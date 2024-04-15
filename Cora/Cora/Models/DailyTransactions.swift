//
//  DailyTransactions.swift
//  Cora
//
//  Created by Fabio Quintanilha on 11/04/24.
//

import Foundation

struct DailyTransactions: Codable {
    let items: [Transaction]
    let date: Date
}
