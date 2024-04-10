//
//  CoraUITransactionViewModeling.swift
//  
//
//  Created by Fabio Quintanilha on 09/04/24.
//

import Foundation

public protocol CoraUITransactionViewModeling {
    var imageName: String { get }
    var amount: String { get }
    var description: String { get }
    var sender: String { get }
    var time: String { get }
    var transactionType: CoraUITransactionViewType { get }
    var category: String? { get }
}
