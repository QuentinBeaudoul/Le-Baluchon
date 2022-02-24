//
//  StubManager.swift
//  WeatherTests
//
//  Created by Quentin on 24/02/2022.
//

import Foundation
@testable import Weather

class StubManager: WeatherManagerProtocol {
    
    func getWeather(lat: Double?, lon: Double?, completion: @escaping ((Result<WeatherContainer?, Error>) -> Void)) {
        let weather = Bundle.decode(WeatherContainer.self, from: "Weather.json", in: Bundle(for: Self.self))
        
        completion(.success(weather))
    }
    
}
