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
    
    func fetchImageData(from stringURL: String) -> Data? {
        guard let url = URL(string: stringURL) else { fatalError() }
        guard let imageData = try? Data(contentsOf: url) else { fatalError() }
        return imageData
    }
}
