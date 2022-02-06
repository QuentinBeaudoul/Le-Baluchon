//
//  MainTabbarController.swift
//  Le Baluchon
//
//  Created by Quentin Beaudoul on 01/02/2022.
//

import UIKit
import ExchangeRates
import Translate
import Weather

class MainTabbarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        delegate = self

        let exchangeRatesViewController = ExchangeRatesManager.shared.getViewController()
        let translateViewController = TranslateManager.shared.getViewController()
        let weatherViewController = WeatherManager.shared.getViewController()

        setViewControllers([exchangeRatesViewController, translateViewController, weatherViewController], animated: true)

        selectedViewController = exchangeRatesViewController
    }
}
