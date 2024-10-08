//
//  AppDelegate.swift
//  LeardingAPI
//
//  Created by Kleiton Mendes on 01/07/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.coordinateSpace.bounds)
        window?.makeKeyAndVisible()
        
        let navigation = UINavigationController(rootViewController: HomeFactory.make())
        window?.rootViewController = navigation
        return true
    }
    
}
