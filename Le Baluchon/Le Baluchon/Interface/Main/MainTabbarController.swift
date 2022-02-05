//
//  MainTabbarController.swift
//  Le Baluchon
//
//  Created by Quentin Beaudoul on 01/02/2022.
//

import Foundation
import UIKit
import ExchangeRates
import Translate
import Weather

class MainTabbarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Exchange Rates
        let exchangeRatesViewController = ExchangeRatesManager.shared.getViewController()

        // Translate
        let translateViewController = TranslateManager.shared.getViewController()

        // Weather
        let weatherViewController = WeatherManager.shared.getViewController()

        let controllers = [exchangeRatesViewController, translateViewController, weatherViewController]
        self.setViewControllers(controllers, animated: false)
    }

    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
