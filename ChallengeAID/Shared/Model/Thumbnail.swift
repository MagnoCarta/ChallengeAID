//
//  Thumbnail.swift
//  ChallengeAID
//
//  Created by Rodrigo Matos Aguiar on 02/07/22.
//

import Foundation

struct Thumbnail: Codable,Hashable {
    
    var imageURL: String?
    var imageType: String?
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "path"
        case imageType = "extension"
    }
}
