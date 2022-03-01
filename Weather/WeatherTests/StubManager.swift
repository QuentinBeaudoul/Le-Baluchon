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
        let network = StubNetworkManager()

        network.fetchData(url: "dump", headers: nil, parameters: nil, parser: WeatherContainer.self) { result in

            switch result {

            case .success(let weather):
                completion(.success(weather))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
