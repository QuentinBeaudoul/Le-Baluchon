//
//  LocationManager.swift
//  Weather
//
//  Created by Quentin on 02/03/2022.
//

import Foundation
import CoreLocation

protocol LocationManagerDelegate: AnyObject {
    func onUpdateLocation(lat: Double, lon: Double)
    func didFailWithError(_ error: Error)
    func didChangeAuthorization()
}

final class LocationManager: NSObject, CLLocationManagerDelegate {
    
    static let shared = LocationManager()
    
    private let locationManager = CLLocationManager()
    private(set) var canUseLocation: Bool
    var delegate: LocationManagerDelegate?
    
    override private init() {
        if #available(iOS 14.0, *) {
            canUseLocation = locationManager.authorizationStatus == .authorizedWhenInUse
        } else {
            canUseLocation = true
        }
        super.init()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
    }
    
    func requestLocation() {
        if canUseLocation {
            locationManager.requestLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            let lat = location.coordinate.latitude
            let lon = location.coordinate.longitude
            delegate?.onUpdateLocation(lat: lat, lon: lon)
        }
    }

    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        delegate?.didFailWithError(error)
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
