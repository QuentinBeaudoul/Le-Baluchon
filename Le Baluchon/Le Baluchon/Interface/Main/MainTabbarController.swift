//
//  MainTabbarController.swift
//  Le Baluchon
//
//  Created by Quentin Beaudoul on 01/02/2022.
//

import Foundation
import UIKit
import Exchange_Rates

class MainTabbarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Exchange Rates
        let exchangeRatesViewController = ExchangeRatesManager.sharedInstance.getViewController()
        let tabBarExchange = UITabBarItem(title: "", image: UIImage(systemName: "externaldrive"), selectedImage: UIImage(named: "ExchangeRateFilled"))
        exchangeRatesViewController.tabBarItem = tabBarExchange

        // Translate
        let translateViewController = UIViewController() // TODO: To be replace ⚠️
//        let tabBarTranslate = UITabBarItem(title: "Translate", image: #imageLiteral(resourceName: "translate.png"), selectedImage: #imageLiteral(resourceName: "translateFilled.png"))
//        translateViewController.tabBarItem = tabBarTranslate

        // Weather
        let weatherViewController = UIViewController() // TODO: To be replace ⚠️
//        let tabBarWeather = UITabBarItem(title: "Weather", image: #imageLiteral(resourceName: "weather.png"), selectedImage: #imageLiteral(resourceName: "weatherFilled.png"))
//        weatherViewController.tabBarItem = tabBarWeather

        let controllers = [exchangeRatesViewController, translateViewController, weatherViewController]

        self.viewControllers = controllers
    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
