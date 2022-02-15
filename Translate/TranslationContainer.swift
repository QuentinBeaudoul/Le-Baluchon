//
//  TranslationContainer.swift
//  Translate
//
//  Created by Quentin on 15/02/2022.
//

import Foundation

class TranslationContainer: Decodable {

    var translations: [Translation]?
    
    enum CodingKeys: String, CodingKey {
        case translations
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        translations = try container.decodeIfPresent([Translation].self, forKey: .translations)
    }
}
