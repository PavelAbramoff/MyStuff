//
//  NetworkRequest.swift
//  MyStuff
//
//  Created by apple on 2/19/24.
//

import Foundation

class NetworkRequest {
    
    static let shared = NetworkRequest()
    private init() {}
    
    func recuestData(completion: @escaping (Result<Data, Error>) -> Void) {
        let key = "20f68a094769ae9a4d5060e74c856696"
        let latitude = 49.3301420
        let longitude = -123.1583647
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\(key)"
        
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, responce, error in
            DispatchQueue.main.async {
                if let error {
                    completion(.failure(error))
                } else {
                    guard let data else { return }
                    completion(.success(data))
                }
            }
        }
        .resume()
    }
}

