//
//  WeatherTests.swift
//  WeatherTests
//
//  Created by Quentin on 24/02/2022.
//

import XCTest
@testable import Weather

class WeatherTests: XCTestCase {
    
    let viewModel = WeatherViewModel()
    
    override func setUp(completion: @escaping (Error?) -> Void) {
        super.setUp(completion: completion)
        
        // Given
        let lat = 40.781563
        let lon = -73.966176
        
        // When
        viewModel.fetchWeather(lat: lat, lon: lon, manager: StubManager()) { result in
            switch result {
            case .success():
                completion(nil)
            case .failure(let error):
                completion(error)
            }
        }
    }
    
    func testGivenLatAndLon_WhenFetchingWeather_ThenWeatherNotNil() {
        
        setUp { [self] error in
            if let error = error {
                XCTAssert(false, error.localizedDescription)
            }
            
            let indexPath = IndexPath(row: 0, section: 1)
            let weather = viewModel.getWeather(at: indexPath)
            XCTAssertTrue(( weather != nil))
        }
    }
    
    func testGivenLatAndLon_WhenFetchingWeather_ThenWeatherCountMustBeOne() {
        setUp { [self] error in
            if let error = error {
                XCTAssert(false, error.localizedDescription)
            }
    
            XCTAssertTrue(( viewModel.getNumberOfItems() == 2))
        }
    }
}
