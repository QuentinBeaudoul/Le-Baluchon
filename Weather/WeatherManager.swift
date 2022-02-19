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

    public func getViewController() -> UIViewController {
        let viewController = WeatherViewController.makeFromStoryboard(in: Bundle(for: Self.self))
        viewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "cloud.sun.rain"), selectedImage: UIImage(systemName: "cloud.sun.rain.fill"))

        return viewController
    }

    /// Default lat and lon for NY City
    public func getWeather(lat: Double? = nil, lon: Double? = nil, completion: @escaping ((Result<WeatherContainer?, Error>) -> Void)) {

        let url = Constante.weatherUrl
        let parameters: [String: Any] = ["appid": Constante.apiKey, "lat": lat ?? Constante.NYLat, "lon": lon ?? Constante.NYLon, "units": "metric"]

        NetworkManager.fetchData(url: url, parameters: parameters, parser: WeatherContainer.self) { result in

            switch result {
            case .success(let weatherContainer):
                completion(.success(weatherContainer))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
