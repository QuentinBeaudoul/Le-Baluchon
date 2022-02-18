//
//  WeatherViewController.swift
//  Weather
//
//  Created by Quentin Beaudoul on 01/02/2022.
//

import UIKit
import CoreLocation

class WeatherViewController: UIViewController {

    @IBOutlet weak var noPermissionView: UIView!
    @IBOutlet weak var loaderView: UIView!

    let viewModel = WeatherViewModel()

    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        
    }

    private func updateUI() {

    }

    @IBAction func updateLocation() {
        viewModel.requestLocation()
        loaderView.isHidden = false
    }
}

extension WeatherViewController: WeatherDelegate {

    func onLocationChanged(lat: Double, lon: Double) {
        loaderView.isHidden = false
        viewModel.fetchWeather(lat: lat, lon: lon) { result in
            self.loaderView.isHidden = true
            switch result {
            case .success():
                self.updateUI()
            case .failure(let error):
                UIAlertController.showAlert(title: "Error", message: "\(error)", on: self)
            }
        }
    }

    func onLocationFailed(error: Error) {
        loaderView.isHidden = true
        UIAlertController.showAlert(title: "Error", message: "Failed to find your location due to:\n \(error)", on: self)
    }
}
