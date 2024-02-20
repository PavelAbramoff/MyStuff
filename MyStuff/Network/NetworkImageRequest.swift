//
//  NetworkImageRequest.swift
//  MyStuff
//
//  Created by apple on 2/19/24.
//

import Foundation

class NetworkImageRequest {
    
    static let shsred = NetworkImageRequest()
    private init() {}
    
    func recuestData(id: String, completion: @escaping (Result<Data, Error>) -> Void) {
        _ = "20f68a094769ae9a4d5060e74c856696"
        _ = 49.3301420
        _ = -123.1583647
        
        let urlString = "https://openweathermap.org/img/wn/\(id)@2x.png"
        
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

