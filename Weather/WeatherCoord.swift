//
//  WeatherCoord.swift
//  Weather
//
//  Created by Quentin Beaudoul on 18/02/2022.
//

import Foundation

class WeatherCoord: Decodable {
    var lon: Double
    var lat: Double

    enum CodingKeys: String, CodingKey {
        case lon
        case lat
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        lon = try container.decode(Double.self, forKey: .lon)
        lat = try container.decode(Double.self, forKey: .lat)
    }

}
