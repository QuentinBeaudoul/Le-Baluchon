//
//  WeatherSys.swift
//  Weather
//
//  Created by Quentin Beaudoul on 18/02/2022.
//

import Foundation

class WeatherSys: Decodable {
    var country: String
    var sunrise: Int
    var sunset: Int

    enum CodingKeys: String, CodingKey {
        case country
        case sunrise
        case sunset
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        country = try container.decode(String.self, forKey: .country)
        sunrise = try container.decode(Int.self, forKey: .sunrise)
        sunset = try container.decode(Int.self, forKey: .sunset)
    }
}
