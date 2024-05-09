//
//  Review.swift
//  NeoTour-iosDDS
//
//  Created by Dmitry on 09.05.2024.
//

import Foundation

struct Review: Hashable, Decodable {
    let id: Int
    let userPhoto: URL
    let userName: String
    let comment: String

    static func getReviews() -> [Review] {
        return [
            Review(id: 0,
                   userPhoto: URL(string:"userImage")!,
                   userName: "Tom",
                   comment: "That was such a nice place. The most beautiful place I’ve ever seen. My advice to everyone not to forget to take warm coa"),
            Review(id: 1,
                   userPhoto: URL(string:"userImage")!,
                   userName: "Tom",
                   comment: "That was such a nice place. The most beautiful place I’ve ever seen. My advice to everyone not to forget to take warm coa")
        ]
    }
}
