//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Quentin Beaudoul on 01/02/2022.
//

import Foundation
import CoreLocation
import LBNetwork

protocol WeatherDelegate: AnyObject {
    func onLocationChanged(lat: Double, lon: Double)
    func onLocationFailed(error: Error)
    func didChangeAuthorization()
}

class WeatherViewModel {

    private var weathers : [WeatherLocation: WeatherContainer?] = [.NY: nil, .currLoc: nil]

    weak var delegate: WeatherDelegate?

    private let manager: WeatherManagerProtocol
    
    init(manager: WeatherManagerProtocol = WeatherManager.shared) {
        self.manager = manager
        LocationManager.shared.delegate = self
    }

    func fetchWeather(lat: Double, lon: Double, completion: @escaping (Result<Void, Error>) -> Void) {
        manager.getWeather(lat: nil, lon: nil) { [self] result in
            switch result {
            case .success(let NYWeather):
                weathers[.NY] = NYWeather
                fetchCurrentLocationWeather(lat: lat, lon: lon, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    private func fetchCurrentLocationWeather(lat: Double, lon: Double, completion: @escaping (Result<Void, Error>) -> Void) {
        manager.getWeather(lat: lat, lon: lon) { [self] result in
            switch result {
            case .success(let currentLocationWeather):
                weathers[.currLoc] = currentLocationWeather
                completion(.success())
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func requestLocation() {
        LocationManager.shared.requestLocation()
    }
    
    func canUseLocation() -> Bool {
        return LocationManager.shared.canUseLocation
    }

    func getNumberOfItems() -> Int {
        return weathers.count
    }

    func getWeather(at indexPath: IndexPath) -> WeatherContainer? {
        guard let weatherLocation = WeatherLocation.init(rawValue: indexPath.row) else { return nil }
        return weathers[weatherLocation] ?? nil
    }

}

extension WeatherViewModel: LocationManagerDelegate {
    func onUpdateLocation(lat: Double, lon: Double) {
        delegate?.onLocationChanged(lat: lat, lon: lon)
    }
    
    func didFailWithError(_ error: Error) {
        delegate?.onLocationFailed(error: error)
    }
    
    func didChangeAuthorization() {
        delegate?.didChangeAuthorization()
    }
}
