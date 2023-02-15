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

        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=2696829a81b1b5827d515ff121700838")!
        let client = URLSession(configuration: .ephemeral)
        let loader = MoviesLocalLoader(url: url, client: client)

        window.rootViewController = UINavigationController(rootViewController: ViewController(with: loader))
        window.makeKeyAndVisible()
        self.window = window
        return true
    }
}
