//
//  DataOperation.swift
//  n26BlurRecreation
//
//  Created by Maria on 04/04/2021.
//

import UIKit

struct DataOperation: Decodable {
    let companyName: String
    let date: String
    let price: String
    let image: String

    init(companyName: String, date: String, price: String, image: String) {
        self.companyName = companyName
        self.date = date
        self.price = price
        self.image = image
    }

    enum CodingKeys: String, CodingKey {
        case companyName, date, price, image
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        companyName = try values.decode(String.self, forKey: .companyName)
        date = try values.decode(String.self, forKey: .date)
        price = try values.decode(String.self, forKey: .price)
        image = try values.decode(String.self, forKey: .image)
    }
}
