//
//  StubManager.swift
//  ExchangeRatesTests
//
//  Created by Quentin on 24/02/2022.
//

import Foundation
@testable import ExchangeRates

class StubManager: ExchangeRateManagerProtocol {
    
    func fetchRates(completion: ((Result<Double, Error>) -> Void)?) {
        completion?(.success(5))
    }

    func getUsdRate() -> Double? {
        return 5
    }

    func isExchangeRateAvailable() -> Bool {
        return getUsdRate() != nil
    }
}


