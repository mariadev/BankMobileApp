//
//  DataOperations.swift
//  n26BlurRecreation
//
//  Created by Maria on 05/04/2021.
//

import Foundation

final class DataOperationsByMonth: Decodable {
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

}
