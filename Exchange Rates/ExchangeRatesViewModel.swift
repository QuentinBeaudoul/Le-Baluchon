//
//  ExchangeRatesViewModel.swift
//  Exchange Rates
//
//  Created by Quentin Beaudoul on 01/02/2022.
//

import Foundation
import Extension
import LBNetwork

class ExchangeRatesViewModel {

    private(set) var source = ""
    private(set) var target = ""
    private let manager: ExchangeRateManagerProtocol

    init(manager: ExchangeRateManagerProtocol = ExchangeRatesManager.shared) {
        self.manager = manager
    }

    func reloadRates(completion: @escaping (Result<Void, Error>) -> Void) {
        manager.fetchRates { result in
            switch result {
            case .success(_):
                completion(.success())
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func updateSource(_ char: String) {
        source.append(char)
    }

    func convert() {
        let convertedValue = (Double(source) ?? 0) * getUSDExchangeRate()
        self.target = "\(convertedValue)"
    }

    func clear() {
        self.source = ""
        self.target = ""
    }

    func hasExchangeRates() -> Bool {
        return manager.isExchangeRateAvailable()
    }

    func getUSDExchangeRate() -> Double {
        return manager.getUsdRate() ?? 0
    }
}
