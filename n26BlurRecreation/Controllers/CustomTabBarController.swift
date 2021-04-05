//
//  CustomeTabBarController.swift
//  n26BlurRecreation
//
//  Created by Maria on 30/03/2021.
//

import UIKit

class CustomTabBarController : UITabBarController {
    
    override func viewDidLoad() {
    
    let oneTableViewController = HomeViewController()
    let twoTableViewController = HomeViewController()
    let threeTableViewController = HomeViewController()
    let fourTableViewController = HomeViewController()
    let fiveTableViewController = HomeViewController()
    
    let wrapperOneTableViewController = oneTableViewController.wrappedInNavigation()
    let wrapperTwoTableViewController = twoTableViewController.wrappedInNavigation()
    let wrapperThreeTableViewController = threeTableViewController.wrappedInNavigation()
    let wrapperFourTableViewController = fourTableViewController.wrappedInNavigation()
    let wrapperFiveTableViewController = fiveTableViewController.wrappedInNavigation()
        
        wrapperOneTableViewController.tabBarItem.image = UIImage(systemName: "rectangle.split.1x2")
        wrapperOneTableViewController.navigationBar.isHidden = true
        wrapperTwoTableViewController.tabBarItem.image = UIImage(systemName: "square.grid.2x2")
        wrapperTwoTableViewController.navigationBar.isHidden = true
        wrapperThreeTableViewController.tabBarItem.image = UIImage(systemName: "plus")
        wrapperThreeTableViewController.navigationBar.isHidden = true
        wrapperFourTableViewController.tabBarItem.image = UIImage(systemName: "square.stack.3d.down.right")
        wrapperFourTableViewController.navigationBar.isHidden = true
        wrapperFiveTableViewController.tabBarItem.image = UIImage(systemName: "person")
        wrapperFiveTableViewController.navigationBar.isHidden = true
        
        UITabBar.appearance().tintColor = UIColor(hex: 0x4f887a)
        
    viewControllers = [  wrapperOneTableViewController, wrapperTwoTableViewController, wrapperThreeTableViewController, wrapperFourTableViewController, wrapperFiveTableViewController]
    }
    
}
