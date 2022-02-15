//
//  Translation.swift
//  Translate
//
//  Created by Quentin Beaudoul on 05/02/2022.
//

import Foundation

class Translation: Decodable {
    var detectedSourceLanguage: String?
    var text: String?

    enum CodingKeys: String, CodingKey {
        case detectedSourceLanguage = "detected_source_language"
        case text
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        detectedSourceLanguage = try container.decodeIfPresent(String.self, forKey: .detectedSourceLanguage)
        text = try container.decodeIfPresent(String.self, forKey: .text)
    }
}
