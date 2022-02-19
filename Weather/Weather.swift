//
//  Weather.swift
//  Weather
//
//  Created by Quentin Beaudoul on 18/02/2022.
//

import Foundation

enum WeatherCondition: String {
    // CLear
    case clearSky = "clear sky"

    // Clouds
    case fewClouds = "few clouds"
    case scatteredClouds = "scattered clouds"
    case brokenClouds = "broken clouds"
    case overcastClouds = "overcast clouds"

    // Rain
    case rain = "rain"
    case showerRain = "shower rain"
    case freezingRain = "freezing rain"

    // ThunderStorm
    case thunderStorm = "thunderstorm"

    // Snow
    case snow = "snow"

    // Mist
    case mist = "mist"
    case smoke = "smoke"
    case haze = "haze"
    case dust = "dust"
    case fog = "fog"
    case sand = "sand"
    case ash = "ash"
    case squall = "squall"
    case tornado = "tornado"


    case unknow
}

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

    func getWeatherCondition() -> WeatherCondition {
        return WeatherCondition.init(rawValue: description) ?? WeatherCondition.init(rawValue: main.lowercased()) ?? WeatherCondition.unknow
    }
}
