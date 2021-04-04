//
//  Table.swift
//  n26BlurRecreation
//
//  Created by Maria on 30/03/2021.
//

import UIKit

final class UserOperation {
    let companyName: String
    let date: String
    let price: String
    let image: UIImage
    
    init(companyName: String, date: String, price: String, image: UIImage) {
        self.image = image
        self.price = price
        self.companyName = companyName
        self.date = date
    }
}



