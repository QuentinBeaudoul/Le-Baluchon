//
//  ExchangeRatesViewModel.swift
//  Exchange Rates
//
//  Created by Quentin Beaudoul on 01/02/2022.
//

import Foundation
import Extension

class ExchangeRatesViewModel {

    private(set) var source = ""
    private(set) var target = ""

    func reloadRates(completion: @escaping (Result<Void, Error>) -> Void) {
        ExchangeRatesManager.shared.fetchRates { result in
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
        return ExchangeRatesManager.shared.isExchangeRateAvailable()
    }

    func getUSDExchangeRate() -> Double {
        return ExchangeRatesManager.shared.getUsdRate() ?? 0
    }
}
