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
        let url = URL(string: "https://gist.githubusercontent.com/KarrarAbdAli/864f6fffa192a14151f65352b68856e8/raw/5183a42cc1c98ed11597039a387104fff0c40fc6/CV.json")!
//
//        var request = URLRequest(url: url)
//        request.httpMethod = "Get"
        session.dataTask(with: url) { (data, response, error) in
            if let _ = error {
                completion(.failure(NetworkingErrors.networkErrorTaskError))
            }
            if let data = data {
                DispatchQueue.main.async {
                    do {
                        let cv = try JSONDecoder().decode(CV.self, from: data)
//                        print(String(data: data, encoding: .utf8))
                        completion(.success(cv))
                    } catch {
                        completion(.failure(NetworkingErrors.jsonPursingError))
                    }
                }
            }
        }.resume()
    }
    
}
