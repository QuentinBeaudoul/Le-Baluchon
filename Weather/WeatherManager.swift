//
//  WeatherManager.swift
//  Weather
//
//  Created by Quentin Beaudoul on 05/02/2022.
//

import UIKit

public final class WeatherManager {
    public static let shared = WeatherManager()
    private init() {}

    public func getViewController() -> UIViewController {
        let viewController = WeatherViewController()
        viewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "cloud.sun.rain"), selectedImage: UIImage(systemName: "cloud.sun.rain.fill"))

        return viewController
    }
}
