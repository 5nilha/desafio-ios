//
//  CoordinatedFlow.swift
//  Cora
//
//  Created by Fabio Quintanilha on 07/04/24.
//

import Foundation
enum CoordinatedFlow {
    case home
    case loginProfile
    case loginPassword
    case transactions
    case transactionDetails

    //TODO: Add the specific View Controller for each case
    var viewController: BaseViewController {
        switch self {
        case .home: return HomeViewController()
        case .loginProfile: return LoginProfileViewController()
        case .loginPassword: return LoginPasswordViewController()
        case .transactions: return TransactionsViewController()
        case .transactionDetails: return TransactionDetailsViewController()
        }
    }
}
