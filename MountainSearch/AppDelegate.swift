//
//  AppDelegate.swift
//  MountainSearch
//
//  Created by Marcus on 7/6/20.
//  Copyright © 2020 Marcus. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
	var window: UIWindow?
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//		let rootVC = MountainsViewController()
		let rootVC = MountainsDetailViewController()
		let navVC = UINavigationController(rootViewController: rootVC)
		window?.rootViewController = navVC
		window?.makeKeyAndVisible()
		return true
	}
}
