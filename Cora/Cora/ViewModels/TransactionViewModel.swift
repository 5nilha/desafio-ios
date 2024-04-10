//
//  TransactionViewModel.swift
//  Cora
//
//  Created by Fabio Quintanilha on 09/04/24.
//

import CoraUI

struct TransactionViewModel: CoraUITransactionViewModeling {
    let imageName: String
    let amount: String
    let description: String
    let sender: String
    let time: String
    let transactionType: CoraUITransactionViewType
    private (set) var category: String?

    init(imageName: String,
         amount: String,
         description: String,
         sender: String,
         time: String,
         transactionType: CoraUITransactionViewType,
         category: String? = nil) {
        self.imageName = imageName
        self.amount = amount
        self.description = description
        self.sender = sender
        self.time = time
        self.transactionType = transactionType
    }
}
