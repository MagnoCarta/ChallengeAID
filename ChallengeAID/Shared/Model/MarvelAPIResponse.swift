//
//  MarvelAPIResponse.swift
//  ChallengeAID
//
//  Created by Rodrigo Matos Aguiar on 02/07/22.
//

import Foundation

struct MarvelAPIResponse {
    var results: [Comic]?
}

extension MarvelAPIResponse: Codable {
    
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    enum DataEnum: String, CodingKey {
        case results
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let dataContainer = try values.nestedContainer(keyedBy: DataEnum.self, forKey: .data)
        results = try dataContainer.decode([Comic].self, forKey: .results)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        var dataContainer = container.nestedContainer(keyedBy: DataEnum.self, forKey: .data)
        try dataContainer.encode(results, forKey: .results)
    }
}
