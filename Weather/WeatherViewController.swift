//
//  WeatherViewController.swift
//  Weather
//
//  Created by Quentin Beaudoul on 01/02/2022.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {

    let viewModel = WeatherViewModel()

    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        
    }

    private func updateUI() {

    }
}

extension WeatherViewController: WeatherDelegate {

    func onLocationChanged(lat: Double, lon: Double) {
        viewModel.fetchWeather(lat: lat, lon: lon) { result in
            switch result {
            case .success():
                self.updateUI()
            case .failure(let error):
                UIAlertController.showAlert(title: "Error", message: "\(error)", on: self)
            }
        }
    }

    func onLocationFailed(error: Error) {
        UIAlertController.showAlert(title: "Error", message: "Failed to find your location due to:\n \(error)", on: self)
    }
}
