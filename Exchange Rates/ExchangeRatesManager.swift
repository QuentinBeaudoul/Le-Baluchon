//
//  ExchangeRatesManager.swift
//  Exchange Rates
//
//  Created by Quentin Beaudoul on 01/02/2022.
//

import UIKit
import Extension

public final class ExchangeRatesManager {
    public static let shared = ExchangeRatesManager()
    private init() {}

    public func getViewController() -> UIViewController {
        let viewController = ExchangeRatesViewController.makeFromStoryboard(in: Bundle(for: Self.self))
        viewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "eurosign.square"), selectedImage: UIImage(systemName: "eurosign.square.fill"))

        return viewController
    }
}
