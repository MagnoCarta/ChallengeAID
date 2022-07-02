//
//  Character.swift
//  ChallengeAID
//
//  Created by Rodrigo Matos Aguiar on 01/07/22.
//

import Foundation
import SwiftUI

class Character: Codable {
    
    var title: String?
    var imageURL: String?
    var summary: String?
    var comicList: [Comic]?
    var authors: [String]?
    var favorite: Bool?

}
