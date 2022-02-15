//
//  Language.swift
//  Translate
//
//  Created by Quentin on 15/02/2022.
//

import Foundation

public class Language: Decodable {
    var sourceLang: String
    var targetLang: String
    
    enum CodingKeys: String, CodingKey {
        case sourceLang = "source_lang"
        case targetLang = "target_lang"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sourceLang = try container.decode(String.self, forKey: .sourceLang).capitalized
        targetLang = try container.decode(String.self, forKey: .targetLang).capitalized
    }
}
