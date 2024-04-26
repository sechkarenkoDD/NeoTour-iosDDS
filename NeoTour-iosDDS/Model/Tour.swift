//
//  Galery.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 15.04.2024.
//

import Foundation

struct Tour: Hashable, Decodable {
    var id: Int
    var title: String
    var image: URL
    var location: String
    var description: String
    var comments: [Comment]
    
    func hash(into hasher: inout Hasher) {
      hasher.combine(identifier)
    }
    
    static func == (lhs: Tour, rhs: Tour) -> Bool {
      return lhs.identifier == rhs.identifier
    }

    private var identifier = UUID()
    
    static func getToursForGalery() -> [Tour] {
        return [
            Tour(id: Int.random(in: 0...5), title: "Nothern Mountain", image: URL(string: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comment.getComments()),
            Tour(id: Int.random(in: 0...5), title: "Nothern Mountain", image: URL(string: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comment.getComments()),
            Tour(id: Int.random(in: 0...5), title: "Nothern Mountain", image: URL(string: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comment.getComments()),
            Tour(id: Int.random(in: 0...5), title: "Nothern Mountain", image: URL(string: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comment.getComments())
        ]
    }
    
    static func getToursForRecommended() -> [Tour] {
        return [
            Tour(id: Int.random(in: 0...5), title: "Nothern Mountain", image: URL(string: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comment.getComments()),
            Tour(id: Int.random(in: 0...5), title: "Nothern Mountain", image: URL(string: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comment.getComments()),
            Tour(id: Int.random(in: 0...5), title: "Nothern Mountain", image: URL(string: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comment.getComments()),
            Tour(id: Int.random(in: 0...5), title: "Nothern Mountain", image: URL(string: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comment.getComments()),
            Tour(id: Int.random(in: 0...5), title: "Nothern Mountain", image: URL(string: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comment.getComments()),
            Tour(id: Int.random(in: 0...5), title: "Nothern Mountain", image: URL(string: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comment.getComments()),
            Tour(id: Int.random(in: 0...5), title: "Nothern Mountain", image: URL(string: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", comments: Comment.getComments())
        ]
    }
  
}

struct Comment: Decodable {
    var image: String
    var author: String
    var content: String
    
    static func getComments() -> [Comment] {
        return [
            Comment(image: "userImage",
                    author: "Tom",
                    content: "That was such a nice place. The most beautiful place I’ve ever seen. My advice to everyone not to forget to take warm coa"),
            Comment(image: "userImage", 
                    author: "Tom",
                    content: "That was such a nice place. The most beautiful place I’ve ever seen. My advice to everyone not to forget to take warm coa")
        ]
    }
}
