//
//  TransactionDetail.swift
//  Cora
//
//  Created by Fabio Quintanilha on 11/04/24.
//

import Foundation

struct TransactionDetail: Decodable {
    let id: String
    let description: String
    let label: String
    let amount: Int
    let counterPartyName: String
    let dateEvent: Date
    let recipient: TransactionParty
    let sender: TransactionParty
    let status: String
}

struct  TransactionParty: Codable {
    let bankName: String
    let bankNumber: String
    let documentNumber: String
    let documentType: String
    let accountNumberDigit: String
    let agencyNumberDigit: String
    let agencyNumber: String
    let name: String
    let accountNumber: String
}
