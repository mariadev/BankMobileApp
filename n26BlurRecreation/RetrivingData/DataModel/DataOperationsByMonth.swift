//
//  DataOperations.swift
//  n26BlurRecreation
//
//  Created by Maria on 05/04/2021.
//

import Foundation

class DataOperationsByMonth: Codable {
    let month: String
    let operations: [DataOperation]
    
    init(month: String, operations: [DataOperation]) {
        self.month =  month
        self.operations = operations
    }

    enum CodingKeys: String, CodingKey {
        case month, operations
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        month = try values.decode(String.self, forKey: .month)
        operations = try values.decode([DataOperation].self, forKey: .operations)
    }


    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

        try container.encode(month, forKey: .month)
        try container.encode(operations, forKey: .operations)
    }
}
