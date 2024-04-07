//
//  CoordinatorDelegate.swift
//  Cora
//
//  Created by Fabio Quintanilha on 06/04/24.
//

import Foundation

protocol CoordinatorDelegate: AnyObject {
    func nextView()
    func previousView()
    func returnToRootView()
}
