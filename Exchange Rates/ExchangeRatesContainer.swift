//
//  ExchangeRatesContainer.swift
//  Exchange Rates
//
//  Created by Quentin on 16/02/2022.
//

import Foundation

public class ExchangeRatesContainer: Decodable {
    var success: Bool
    var timestamp: Int
    var base: String
    var date: String
    var rates: ExchangeRates
    
    enum CodingKeys: String, CodingKey {
        case success
        case timestamp
        case base
        case date
        case rates
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        success = try container.decode(Bool.self, forKey: .success)
        timestamp = try container.decode(Int.self, forKey: .timestamp)
        base = try container.decode(String.self, forKey: .base)
        date = try container.decode(String.self, forKey: .date)
        rates = try container.decode(ExchangeRates.self, forKey: .rates)
    }
}
