//
//  ComicThumbnail.swift
//  ChallengeAID
//
//  Created by Rodrigo Matos Aguiar on 02/07/22.
//

import Foundation

struct Thumbnail: Codable, Hashable {
    
    var imageURL: String?
    var imageType: String?
    var computedURL: String {
        guard var imageURL = imageURL, let imageType = imageType else {
            return ""
        }
        let i = imageURL.index(imageURL.startIndex, offsetBy: 4)
        imageURL.insert("s", at: i)
        
        return imageURL + "." + imageType
    }
    var smallPortraitURL: String {
        guard var imageURL = imageURL, let imageType = imageType else {
            return ""
        }
        let i = imageURL.index(imageURL.startIndex, offsetBy: 4)
        imageURL.insert("s", at: i)
        
        return imageURL + "/portrait_medium." + imageType
        
    }
    
    enum CodingKeys: String, CodingKey {
        case imageURL = "path"
        case imageType = "extension"
    }
}
