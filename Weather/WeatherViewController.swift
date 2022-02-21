//
//  WeatherViewController.swift
//  Weather
//
//  Created by Quentin Beaudoul on 01/02/2022.
//

import UIKit
import CoreLocation
import Extension

class WeatherViewController: UIViewController {

    @IBOutlet weak var noPermissionView: UIView!
    @IBOutlet weak var loaderView: UIView!
    @IBOutlet weak var activityIndicatorView: UIView!
    @IBOutlet weak var tableView: UITableView!

    let viewModel = WeatherViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicatorView.applyActivityIndicator()
        
        viewModel.delegate = self
        viewModel.requestLocation()
        noPermissionView.isHidden = viewModel.canUseLocation

        tableView.register(UINib(nibName: WeatherDetailsView.getCellIdentifier(), bundle: Bundle(for: Self.self)), forCellReuseIdentifier: WeatherDetailsView.getCellIdentifier())
        tableView.dataSource = self
    }

    private func updateUI() {
        noPermissionView.isHidden = true
        tableView.reloadData()
    }

    @IBAction func goToPermission() {
        guard let settingsUrl = URL(string: UIApplication.openSettingsURLString) else { return }

        if UIApplication.shared.canOpenURL(settingsUrl) {
            UIApplication.shared.open(settingsUrl, completionHandler: { (success) in
                print("Settings opened: \(success)")
            })
        }
    }

    @IBAction func updateLocation() {
        viewModel.requestLocation()
        loaderView.isHidden = false
    }
}

extension WeatherViewController: WeatherDelegate {

    func didChangeAuthorization() {
        if viewModel.canUseLocation {
            viewModel.requestLocation()
        } else {
            UIAlertController.showAlert(title: "Authorization issue", message: "We need your authorization to display the weather informations based on your location", on: self)
        }
    }

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

extension WeatherViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getNumberOfItems()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: WeatherDetailsView.getCellIdentifier(), for: indexPath) as? WeatherDetailsView else { return UITableViewCell() }
        guard let weatherContainer = viewModel.getWeather(at: indexPath) else { return UITableViewCell() }

        cell.fillView(weatherContainer: weatherContainer)

        return cell
    }
}
