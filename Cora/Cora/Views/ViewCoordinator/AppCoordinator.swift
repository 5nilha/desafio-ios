//
//  AppCoordinator.swift
//  Cora
//
//  Created by Fabio Quintanilha on 06/04/24.
//

import UIKit

class AppCoordinator: Coordinator {

    private let navigationController: UINavigationController
    private var currentFlow: [CoordinatedFlow] = []

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showView(.home)
    }

    private func showView(_ coordinatedView: CoordinatedFlow) {
        let viewController = coordinatedView.viewController
        viewController.delegate = self
        currentFlow.append(coordinatedView)
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension AppCoordinator: CoordinatorDelegate {
    func nextView() {
        guard let currentCoordinatedView = currentFlow.last else { return }
        switch currentCoordinatedView {
        case .home:
            showView(.loginProfile)
        case .loginProfile:
            showView(.loginPassword)
        case .loginPassword:
            showView(.bankStatement)
        case .bankStatement:
            showView(.bankStatementDetails)
        default:
            break
        }
    }

    func previousView() {
        if navigationController.viewControllers.count > 1 {
            currentFlow.removeLast()
            navigationController.popViewController(animated: true)
        }
    }

    func returnToRootView() {
        let first = currentFlow.first
        currentFlow.removeAll()
        if let firstScreen = first {
            currentFlow.append(firstScreen)
        }

        navigationController.popToRootViewController(animated: true)
    }
}
