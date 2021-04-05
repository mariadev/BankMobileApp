//
//  Presenter.swift
//  n26BlurRecreation
//
//  Created by Maria on 05/04/2021.
//

import Foundation

class ModelData {
    
    let userDataProvider = RetriveData()
    
    func getModel() -> [DataOperationsByMonth] {
        guard let data = userDataProvider.readLocalFile(forName: "UserData") else {
             return []
        }
        print(" data.operationsByMonth", data.operationsByMonth)
        return data.operationsByMonth
    }
    
}
