//
//  DataOperation.swift
//  n26BlurRecreation
//
//  Created by Maria on 04/04/2021.
//

import UIKit

struct DataOperation: Codable {
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

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(companyName, forKey: .companyName)
        try container.encode(date, forKey: .date)
        try container.encode(price, forKey: .price)
        try container.encode(image, forKey: .image)
    }
}
