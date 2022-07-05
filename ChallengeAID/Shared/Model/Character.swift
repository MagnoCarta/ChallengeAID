//
//  Character.swift
//  ChallengeAID
//
//  Created by Rodrigo Matos Aguiar on 01/07/22.
//

import Foundation
import SwiftUI

class Character: Codable,Hashable {
    
    var id: Int?
    var title: String?
    var thumbnail: Thumbnail?
    var summary: String?
    var comicList: [Comic]?
    var authors: [String]?
    var favorite: Bool?
    
    static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
