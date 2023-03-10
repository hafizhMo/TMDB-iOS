//
//  AppDelegate.swift
//  TMDB-iOS
//
//  Created by Hafizh Mo on 04/02/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let window = UIWindow(frame: UIScreen.main.bounds)

        window.rootViewController = UINavigationController(rootViewController: MoviesFactory.create())
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}
