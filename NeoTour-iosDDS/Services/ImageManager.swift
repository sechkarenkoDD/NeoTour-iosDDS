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
    
    func fetchImageData(from url: URL?) -> Data? {
        guard let url = url else { fatalError("URL is faral error") }
        guard let imageData = try? Data(contentsOf: url) else { fatalError("Image data is failed") }
        return imageData
    }
}
