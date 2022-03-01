//
//  StubNetworkManager.swift
//  WeatherTests
//
//  Created by Quentin Beaudoul on 01/03/2022.
//

import Foundation
import LBNetwork

@testable import Weather

class StubNetworkManager: NetworkManagerProtocol {
    func fetchData<T>(url: String, headers: [String : String]?, parameters: [String : Any]?, parser: T.Type, completion: @escaping (Result<T?, Error>) -> Void) where T : Decodable {
        if let weather = Bundle.decode(WeatherContainer.self, from: "Weather.json", in: Bundle(for: Self.self)) as? T {
            completion(.success(weather))
        } else {
            completion(.success(nil))
        }
    }
}
