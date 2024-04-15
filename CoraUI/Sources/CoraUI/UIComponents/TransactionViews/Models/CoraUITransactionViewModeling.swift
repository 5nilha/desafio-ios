//
//  CoraUITransactionViewModeling.swift
//  
//
//  Created by Fabio Quintanilha on 09/04/24.
//

import Foundation

public protocol CoraUITransactionViewModeling {
    var id: String { get }
    var imageName: String { get }
    var amount: String { get }
    var description: String { get }
    var name: String { get }
    var time: String { get }
    var transactionType: CoraUITransactionViewType { get }
}
