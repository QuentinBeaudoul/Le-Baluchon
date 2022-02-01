//
//  ExchangeRatesManager.swift
//  Exchange Rates
//
//  Created by Quentin Beaudoul on 01/02/2022.
//

import UIKit

public final class ExchangeRatesManager {
    public static let sharedInstance = ExchangeRatesManager()

    private init() {}

    public func getViewController() -> UIViewController {
        return ExchangeRatesViewController()
    }
}
