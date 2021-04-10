//
//  DataUser.swift
//  n26BlurRecreation
//
//  Created by Maria on 04/04/2021.
//

import UIKit

struct DataUser: Codable {
    let user: String
    let operationsByMonth: [DataOperationsByMonth]

    init(user: String, operationsByMonth: [DataOperationsByMonth]) {
        self.user = user
        self.operationsByMonth = operationsByMonth
    }

    enum CodingKeys: String, CodingKey {
        case user, operationsByMonth
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        user = try values.decode(String.self, forKey: .user)
        operationsByMonth = try values.decode([DataOperationsByMonth].self, forKey: .operationsByMonth)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(user, forKey: .user)
        try container.encode(operationsByMonth, forKey: .operationsByMonth)
    }
}
