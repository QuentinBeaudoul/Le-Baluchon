//
//  Translation.swift
//  Translate
//
//  Created by Quentin Beaudoul on 05/02/2022.
//

import Foundation

public class Translation: Decodable {
    var detectedSourceLanguage: String?
    var text: String?

    enum CodingKeys: String, CodingKey {
        case translations
    }

    enum TranslationCodingKeys: String, CodingKey {
        case detectedSourceLanguage = "detected_source_language"
        case text
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let translationContainer = try container.nestedContainer(keyedBy: TranslationCodingKeys.self, forKey: .translations)
        detectedSourceLanguage = try translationContainer.decodeIfPresent(String.self, forKey: .detectedSourceLanguage)
        text = try translationContainer.decodeIfPresent(String.self, forKey: .text)
    }
}
