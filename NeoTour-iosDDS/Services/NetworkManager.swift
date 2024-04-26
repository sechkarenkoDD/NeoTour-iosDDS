//
//  NetworkManager.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 23.04.2024.
//

import Foundation


class NetworkManager {
    
    enum NetworkError: Error {
        case invalidURL
        case noData
    }
    
    static let shered = NetworkManager()
    private init() {}
    
    func fetchCategories(completion: @escaping(Result<[Category], NetworkError>) -> Void) {
        let url = "https://pudge-backender.org.kg/tours/tour_category/?format=json"
        getData(urlString: url, completion: completion)
    }
    
    func fetchTours(completion: @escaping(Result<[Tour], NetworkError>) -> Void) {
        let url = "https://pudge-backender.org.kg/tours/"
        getData(urlString: url, completion: completion)
    }
}

extension NetworkManager {
    private func getData<T: Decodable>(urlString: String, completion: @escaping (Result<T, NetworkError>) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(.failure(.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let data = try decoder.decode(T.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(data))
                }
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}

