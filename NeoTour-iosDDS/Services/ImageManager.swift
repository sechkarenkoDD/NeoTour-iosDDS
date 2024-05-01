//
//  ImageManager.swift
//
//
//  Created by Dmitry on 18.04.2024.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
    
    private init() {}
    
    //    func fetchImageData(from url: URL?) -> Data? {
    //        guard let url = url else { fatalError("URL imageData is failed") }
    //        guard let imageData = try? Data(contentsOf: url) else { fatalError("imageData is failed") }
    //        return imageData
    //    }
    
    
    //    func fetchImage(from url: URL?) -> Data? {
    //        Task { data in
    //            do {
    //                let imageData = try await getImage(url)
    //            } catch {
    //                print(error)
    //            }
    //            return data
    //        }
    //    }
    
    func fetchImage(_ url: URL?) async throws -> Data {
        guard let url = url else { throw NetworkError.invalidURL }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse,
                 httpResponse.statusCode == 200 else {
               throw NetworkError.invalidResponse
           }
        
        return data
    }
}
