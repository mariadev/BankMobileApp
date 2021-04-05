//
//  Presenter.swift
//  n26BlurRecreation
//
//  Created by Maria on 05/04/2021.
//

import Foundation

class RetrieveData {
    
    let userDataProvider = ParseJson()
  
    func getModel() -> [DataOperationsByMonth] {
        guard let data = userDataProvider.readLocalFile(forName: "UserData") else {
             return []
        }
        print(" data.operationsByMonth", data.operationsByMonth)
        return data.operationsByMonth
    }
    
}
