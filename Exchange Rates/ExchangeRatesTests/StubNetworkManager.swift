//
//  StubNetworkManager.swift
//  ExchangeRatesTests
//
//  Created by Quentin Beaudoul on 01/03/2022.
//

import Foundation
import LBNetwork
import ExchangeRates

class StubNetworkManager: NetworkManagerProtocol {

    func fetchData<T: Decodable>(url: String, headers: [String : String]?, parameters: [String : Any]?, parser: T.Type, completion: @escaping (Result<T?, Error>) -> Void){
        if let container = Bundle.decode(ExchangeRatesContainer.self, from: "ExchangeRates.json", in: Bundle(for: Self.self)) as? T {
            completion(.success(container))
        } else {
            completion(.success(nil))
        }
    }
}
