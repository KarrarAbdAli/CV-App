//
//  NetworkServices.swift
//  CV App
//
//  Created by Karrar Abd Ali on 26/03/2020.
//  Copyright © 2020 Karrar Abd Ali. All rights reserved.
//

import Foundation
class NetworkServices{
    let session = URLSession.shared
    
    func fetchCVJsonData(completion: @escaping (Result<CV,Error>) -> Void){
        let url = URL(string: "https://gist.githubusercontent.com/KarrarAbdAli/864f6fffa192a14151f65352b68856e8/raw/1ba673a3b481d6333a2ebccbb2191c4f6a293517/CV.json")!
        
        session.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completion(.failure(NetworkingErrors.networkErrorTaskError))
            }
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        let cv = try JSONDecoder().decode(CV.self, from: data)
                        completion(.success(cv))
                    } catch {
                        completion(.failure(NetworkingErrors.jsonPursingError))
                    }
                }
            }
        }.resume()
    }
    
}
