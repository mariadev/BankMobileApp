//
//  AppDelegate.swift
//  n26BlurRecreation
//
//  Created by Maria on 30/03/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
//    var raceDetailViewController: RaceDetailViewController!
//    var storiesDetailViewController: StoriesDetailViewController!
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        
        let tabBarController =  CustomeTabBarController()
        tabBarController.delegate = self
    

//        [storiesDetailViewController, raceDetailViewController].forEach {
//            $0?.navigationController?.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
//        }
        window?.rootViewController = tabBarController
        
        return true
    }
}

extension AppDelegate: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        guard let navigationController = viewController as? UINavigationController,
            let viewController = navigationController.viewControllers.first else { return }
        
        let detailNavigation: UINavigationController
        
    }
}
