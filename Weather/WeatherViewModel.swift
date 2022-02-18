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
}

class WeatherViewModel: NSObject {

    private(set) var locationWeather: WeatherContainer?
    private let locationManager = CLLocationManager()

    weak var delegate: WeatherDelegate?

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestLocation()
    }

    func fetchWeather(lat: Double, lon: Double, completion: @escaping (Result<Void, Error>) -> Void) {
        WeatherManager.shared.getWeather(lat: lat, lon: lon) { result in
            switch result {
            case .success(let weatherContainer):
                self.locationWeather = weatherContainer
                completion(.success())
            case .failure(let error):
                completion(.failure(error))
            }
        }
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
}
