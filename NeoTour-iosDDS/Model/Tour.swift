//
//  Galery.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 15.04.2024.
//

import Foundation

struct Tour: Hashable, Decodable {
    var id: Int
    var name: String
    var tourPhoto: String
    var location: String
    var description: String
    var reviews: [Review]
    
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case tourPhoto = "tour_photo"
        case location
        case description
        case reviews
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Tour, rhs: Tour) -> Bool {
        return lhs.id == rhs.id
    }
    
    
    static func getToursForGalery() -> [Tour] {
        return [
            Tour(id: Int.random(in: 0...5), name: "Nothern Mountain", tourPhoto: "testImage", location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", reviews: Review.getReviews()),
            Tour(id: Int.random(in: 0...5), name: "Nothern Mountain", tourPhoto: "testImage", location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", reviews: Review.getReviews()),
            Tour(id: Int.random(in: 0...5), name: "Nothern Mountain", tourPhoto: "testImage", location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", reviews: Review.getReviews()),
            Tour(id: Int.random(in: 0...5), name: "Nothern Mountain", tourPhoto: "testImage", location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", reviews: Review.getReviews())
        ]
    }
    
    static func getToursForRecommended() -> [Tour] {
        return [
            Tour(id: Int.random(in: 0...5), name: "Nothern Mountain", tourPhoto: "testImage", location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", reviews: Review.getReviews()),
            Tour(id: Int.random(in: 0...5), name: "Nothern Mountain", tourPhoto: "testImage", location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", reviews: Review.getReviews()),
            Tour(id: Int.random(in: 0...5), name: "Nothern Mountain", tourPhoto: "testImage", location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", reviews: Review.getReviews()),
            Tour(id: Int.random(in: 0...5), name: "Nothern Mountain", tourPhoto: "testImage", location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", reviews: Review.getReviews()),
            Tour(id: Int.random(in: 0...5), name: "Nothern Mountain", tourPhoto: "testImage", location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", reviews: Review.getReviews()),
            Tour(id: Int.random(in: 0...5), name: "Nothern Mountain", tourPhoto: "testImage", location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", reviews: Review.getReviews()),
            Tour(id: Int.random(in: 0...5), name: "Nothern Mountain", tourPhoto: "testImage", location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", reviews: Review.getReviews())
        ]
    }
    
}

struct Review: Hashable, Decodable {
    var id: Int
    var userPhoto: String
    var userName: String
    var comment: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case userPhoto = "user_photo"
        case userName = "user_name"
        case comment
    }
    
    static func getReviews() -> [Review] {
        return [
            Review(id: 0,
                   userPhoto: "userImage",
                   userName: "Tom",
                   comment: "That was such a nice place. The most beautiful place I’ve ever seen. My advice to everyone not to forget to take warm coa"),
            Review(id: 1,
                   userPhoto: "userImage",
                   userName: "Tom",
                   comment: "That was such a nice place. The most beautiful place I’ve ever seen. My advice to everyone not to forget to take warm coa")
        ]
    }
}


