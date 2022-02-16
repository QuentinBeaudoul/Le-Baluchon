//
//  ExchangeRate.swift
//  Exchange Rates
//
//  Created by Quentin on 16/02/2022.
//

import Foundation

class ExchangeRates: Decodable {
    var usd: Double
    
    enum CodingKeys: String, CodingKey {
        case usd = "USD"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        usd = try container.decode(Double.self, forKey: .usd)
    }
}
