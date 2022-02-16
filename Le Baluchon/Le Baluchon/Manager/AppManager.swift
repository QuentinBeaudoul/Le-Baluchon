//
//  AppManager.swift
//  Le Baluchon
//
//  Created by Quentin on 16/02/2022.
//

import Foundation
import ExchangeRates

final class AppManager {
    static let shared = AppManager()
    private init() {}
    
    func hasExchangeRate() -> Bool {
        return ExchangeRatesManager.shared.getUsdRate() != nil
    }
}
