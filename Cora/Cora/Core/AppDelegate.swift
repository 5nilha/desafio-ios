//
//  AppDelegate.swift
//  Cora
//
//  Created by Fabio Quintanilha on 06/04/24.
//

import UIKit
import CoraUI

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        ThemeManager.applyTheme(theme: .light)
        setupNavigationControllerUI()
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    private func setupNavigationControllerUI() {
        UINavigationBar.appearance().backgroundColor = ThemeManager.current.lightColor
        UINavigationBar.appearance().tintColor = ThemeManager.current.primaryColor
        configureNavigationBarTitleFont()
    }

    private func configureNavigationBarTitleFont() {
            let attributes: [NSAttributedString.Key: Any] = [
                .font: CoraFonts.regular(ofSize: 14).font,
                .foregroundColor: ThemeManager.current.darkTextColor
            ]

            if #available(iOS 15, *) {
                let appearance = UINavigationBarAppearance()
                appearance.titleTextAttributes = attributes
                appearance.configureWithOpaqueBackground()
                UINavigationBar.appearance().standardAppearance = appearance
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
                UINavigationBar.appearance().compactAppearance = appearance
            } else {
                UINavigationBar.appearance().titleTextAttributes = attributes
            }
        }
}
