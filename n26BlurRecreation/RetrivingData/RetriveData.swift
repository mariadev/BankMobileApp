//
//  UserDataProvider.swift
//  n26BlurRecreation
//
//  Created by Maria on 04/04/2021.
//

import Foundation

class RetriveData {
    
     func loadJson(fromURLString urlString: String,
                          completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: urlString) {
            let urlSession = URLSession(configuration: .default).dataTask(with: url) { (data, response, error) in
                if let error = error {
                    completion(.failure(error))
                }
                
                if let data = data {
                    print(" completion(.success(data))", completion(.success(data)))
                    completion(.success(data))
                }
            }
            
            urlSession.resume()
        }
    }
    
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
