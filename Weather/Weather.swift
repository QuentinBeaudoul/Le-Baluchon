//
//  Weather.swift
//  Weather
//
//  Created by Quentin Beaudoul on 18/02/2022.
//

import Foundation

class Weather: Decodable {
    var main: String
    var description: String

    enum CodingKeys: String, CodingKey {
        case main
        case description
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        main = try container.decode(String.self, forKey: .main)
        description = try container.decode(String.self, forKey: .description)
    }
}
