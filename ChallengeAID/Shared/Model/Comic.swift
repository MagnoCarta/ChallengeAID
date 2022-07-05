//
//  Comic.swift
//  ChallengeAID
//
//  Created by Rodrigo Matos Aguiar on 01/07/22.
//

import Foundation
import SwiftUI

struct Comic: Hashable {
    
    var id: Int?
    var name: String?
    var thumbnail: Thumbnail?
    var summary: String?
    var characterList: [ComicCharacter]?
    var authors: [Author]?
    var favorite: Bool?
}

extension Comic: Codable {
    
    enum CodingKeys: String, CodingKey {
        case id
        case name = "title"
        case summary = "description"
        case characterList = "characters"
        case authors = "creators"
        case thumbnail
    }

    enum Authors: String, CodingKey {
        case items
    }
    
    enum Characters: String, CodingKey {
        case items
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int.self, forKey: .id)
        name = try values.decode(String.self, forKey: .name)
        summary = try? values.decode(String.self, forKey: .summary)
        thumbnail = try values.decode(Thumbnail.self, forKey: .thumbnail)

        let authorsContainer = try values.nestedContainer(keyedBy: Authors.self, forKey: .authors)
        authors = try authorsContainer.decode([Author].self, forKey: .items)
        
        let charactersContainer = try values.nestedContainer(keyedBy: Characters.self, forKey: .characterList)
        characterList = try charactersContainer.decode([ComicCharacter].self, forKey: .items)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encode(summary, forKey: .summary)
        try container.encode(characterList, forKey: .characterList)
        try container.encode(thumbnail, forKey: .thumbnail)

        var authorsContainer = container.nestedContainer(keyedBy: Authors.self, forKey: .authors)
        try authorsContainer.encode(authors, forKey: .items)
    }
}
