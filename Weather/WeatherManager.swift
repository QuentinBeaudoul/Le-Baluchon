//
//  WeatherManager.swift
//  Weather
//
//  Created by Quentin Beaudoul on 05/02/2022.
//

import UIKit
import Extension
import LBNetwork

public final class WeatherManager {
    public static let shared = WeatherManager()
    private init() {}

    private(set) var nyWeather: WeatherContainer?

    public func getViewController() -> UIViewController {
        let viewController = WeatherViewController.makeFromStoryboard(in: Bundle(for: Self.self))
        viewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "cloud.sun.rain"), selectedImage: UIImage(systemName: "cloud.sun.rain.fill"))

        return viewController
    }

    public func getWeather(lat: Double? = nil, lon: Double? = nil, completion: ((Result<WeatherContainer?, Error>) -> Void)? = nil) {

        let isDefaultLocation = lat == nil && lon == nil

        let url = Constante.weatherUrl
        let parameters: [String: Any] = ["appid": Constante.apiKey, "lat": lat ?? Constante.NYLat, "lon": lon ?? Constante.NYLon]

        NetworkManager.fetchData(url: url, parameters: parameters, parser: WeatherContainer.self) { result in

            switch result {
            case .success(let weatherContainer):
                if isDefaultLocation {
                    self.nyWeather = weatherContainer
                }
                completion?(.success(weatherContainer))
            case .failure(let error):
                completion?(.failure(error))
            }
        }
    }
}
