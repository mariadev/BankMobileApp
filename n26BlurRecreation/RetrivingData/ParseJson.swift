//
//  UserDataProvider.swift
//  n26BlurRecreation
//
//  Created by Maria on 04/04/2021.
//

import Foundation

class ParseJson {
    
    func readLocalFile(forName name: String) -> DataUser? {
        do {
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let dataUser: DataUser = try! JSONDecoder().decode(DataUser.self, from: jsonData)
                return dataUser
            }
        } catch {
            print(error)
        }
        
        return nil
    }
}
