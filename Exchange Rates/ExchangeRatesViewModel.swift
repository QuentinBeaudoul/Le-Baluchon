//
//  ExchangeRatesViewModel.swift
//  Exchange Rates
//
//  Created by Quentin Beaudoul on 01/02/2022.
//

import Foundation
import Extension

class ExchangeRatesViewModel {

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
}
