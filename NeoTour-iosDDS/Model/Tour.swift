//
//  Galery.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 15.04.2024.
//

import Foundation

struct Tour: Hashable, Decodable {
    let id: Int
    let name: String
    let tourPhoto: URL
    let location: String
    let description: String
    let reviews: [Review]?
    
    static func getToursForGalery() -> [Tour] {
        return [
            Tour(id: Int.random(in: 0...5), name: "Nothern Mountain", tourPhoto: URL(string: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", reviews: Review.getReviews()),
            Tour(id: Int.random(in: 0...5), name: "Nothern Mountain", tourPhoto: URL(string: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", reviews: Review.getReviews()),
            Tour(id: Int.random(in: 0...5), name: "Nothern Mountain", tourPhoto: URL(string: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", reviews: Review.getReviews()),
            Tour(id: Int.random(in: 0...5), name: "Nothern Mountain", tourPhoto: URL(string: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", reviews: Review.getReviews())
        ]
    }
    
    static func getToursForRecommended() -> [Tour] {
        return [
            Tour(id: Int.random(in: 0...7), name: "Nothern Mountain", tourPhoto: URL(string: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", reviews: Review.getReviews()),
            Tour(id: Int.random(in: 0...7), name: "Nothern Mountain", tourPhoto: URL(string: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", reviews: Review.getReviews()),
            Tour(id: Int.random(in: 0...7), name: "Nothern Mountain", tourPhoto: URL(string: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", reviews: Review.getReviews()),
            Tour(id: Int.random(in: 0...7), name: "Nothern Mountain", tourPhoto: URL(string: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", reviews: Review.getReviews()),
            Tour(id: Int.random(in: 0...7), name: "Nothern Mountain", tourPhoto: URL(string: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", reviews: Review.getReviews()),
            Tour(id: Int.random(in: 0...7), name: "Nothern Mountain", tourPhoto: URL(string: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", reviews: Review.getReviews()),
            Tour(id: Int.random(in: 0...7), name: "Nothern Mountain", tourPhoto: URL(string: "testImage")!, location: "Hawaii", description: "Immerse yourself in the world of winter wonder at our ski resort, nestled in picturesque mountains. Enjoy endless slopes and fresh air as you conquer the snow-covered trails. Discover perfect conditions for skiing and snowboarding, cozy hotel rooms, and a variety of entertainment for the whole family.", reviews: Review.getReviews())
        ]
    }
    
}
