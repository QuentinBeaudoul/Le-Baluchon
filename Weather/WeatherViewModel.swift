//
//  WeatherViewModel.swift
//  Weather
//
//  Created by Quentin Beaudoul on 01/02/2022.
//

import Foundation
import CoreLocation

protocol WeatherDelegate: AnyObject {
    func onLocationChanged(lat: Double, lon: Double)
    func onLocationFailed(error: Error)
    func didChangeAuthorization()
}

class WeatherViewModel: NSObject {

    private var weathers : [WeatherLocation: WeatherContainer?] = [.NY: nil, .currLoc: nil]
    private(set) var canUseLocation: Bool
    let locationManager = CLLocationManager()

    weak var delegate: WeatherDelegate?

    override init() {
        
        if #available(iOS 14.0, *) {
            canUseLocation = locationManager.authorizationStatus == .authorizedWhenInUse
        } else {
            canUseLocation = true
        }
        
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()

    }

    func fetchWeather(lat: Double, lon: Double, manager: WeatherManagerProtocol = WeatherManager.shared, completion: @escaping (Result<Void, Error>) -> Void) {
        manager.getWeather(lat: nil, lon: nil) { [self] result in
            switch result {
            case .success(let NYWeather):
                weathers[.NY] = NYWeather
                fetchCurrentLocationWeather(lat: lat, lon: lon, manager: manager, completion: completion)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    private func fetchCurrentLocationWeather(lat: Double, lon: Double, manager: WeatherManagerProtocol, completion: @escaping (Result<Void, Error>) -> Void) {
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
        if canUseLocation {
            locationManager.requestLocation()
        }
    }

    func getNumberOfItems() -> Int {
        return weathers.count
    }

    func getWeather(at indexPath: IndexPath) -> WeatherContainer? {
        guard let weatherLocation = WeatherLocation.init(rawValue: indexPath.row) else { return nil }
        return weathers[weatherLocation] ?? nil
    }

}

extension WeatherViewModel: CLLocationManagerDelegate {

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            delegate?.onLocationChanged(lat: lat, lon: lon)
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        delegate?.onLocationFailed(error: error)
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse:
            // Enable your app's location features.
            canUseLocation = true
        default:
            break
        }
        delegate?.didChangeAuthorization()
    }
}
