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
    case bankStatement
    case bankStatementDetails

    //TODO: Add the specific View Controller for each case
    var viewController: BaseViewController {
        switch self {
        case .home: return BaseViewController()
        case .loginProfile: return BaseViewController()
        case .loginPassword: return BaseViewController()
        case .bankStatement: return BaseViewController()
        case .bankStatementDetails: return BaseViewController()
        }
    }
}
