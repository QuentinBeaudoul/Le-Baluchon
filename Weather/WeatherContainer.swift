//
//  WeatherContainer.swift
//  Weather
//
//  Created by Quentin Beaudoul on 18/02/2022.
//

import Foundation

public class WeatherContainer: Decodable {
    var coord: WeatherCoord
    var weather: [Weather]
    var temperatures: WeatherTemperature
    var sys: WeatherSys
    var visibility: Int
    var timezone: Double
    var name: String

    enum CodingKeys: String, CodingKey {
        case coord
        case weather
        case temperatures = "main"
        case sys
        case visibility
        case timezone
        case name
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        coord = try container.decode(WeatherCoord.self, forKey: .coord)
        weather = try container.decode([Weather].self, forKey: .weather)
        temperatures = try container.decode(WeatherTemperature.self, forKey: .temperatures)
        sys = try container.decode(WeatherSys.self, forKey: .sys)
        visibility = try container.decode(Int.self, forKey: .visibility)
        timezone = try container.decode(Double.self, forKey: .timezone)
        name = try container.decode(String.self, forKey: .name)
    }

}
