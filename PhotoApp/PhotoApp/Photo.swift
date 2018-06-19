//
//  Photo.swift
//  PhotoApp
//
//  Created by Michael A on 2018-06-19.
//  Copyright © 2018 AI Labs. All rights reserved.
//

import Foundation

struct Photo: Codable {
    let id: String
    let createDate: String
    let updatedDate: String
    let width: Int
    let height: Int
    let imageUrls: [String: String]
    let likes: Int
    
    enum CodingKeys: String, CodingKey {
        case createDate = "created_at"
        case updatedDate = "updated_at"
        case imageUrls = "urls"
        case likes
        case id
        case width
        case height
    }
}


