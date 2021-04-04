//
//  UIController+Navigation.swift
//  Stackview
//
//  Created by Maria on 12/01/2021.
//

import UIKit

extension UIViewController {
    func wrappedInNavigation() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}

