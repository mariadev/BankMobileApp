//
//  CustomeTabBarController.swift
//  n26BlurRecreation
//
//  Created by Maria on 30/03/2021.
//

import UIKit

class CustomTabBarController: UITabBarController {

    let retrieveData =  RetrieveData()
    var model: [DataOperationsByMonth] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        model = retrieveData.getModel()

        viewControllers = [
            "rectangle.split.1x2",
            "square.grid.2x2",
            "plus",
            "square.stack.3d.down.right",
            "person"
        ].map {

            let controller = UINavigationController(rootViewController: HomeViewController(model: model))
            controller.tabBarItem.image = UIImage(systemName: $0)
            controller.navigationBar.isHidden = true
            return controller
        }
    }
}
