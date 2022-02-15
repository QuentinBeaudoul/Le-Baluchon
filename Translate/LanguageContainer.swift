//
//  LanguageContainer.swift
//  Translate
//
//  Created by Quentin on 15/02/2022.
//

import Foundation

public class LanguageContainer: Decodable {
    var languages: [Language]?
    
    enum CodingKeys: String, CodingKey {
        case languages = "supported_languages"
    }
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        languages = try container.decodeIfPresent([Language].self, forKey: .languages)
    }
}
