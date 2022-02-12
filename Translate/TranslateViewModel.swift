//
//  TranslateViewModel.swift
//  Translate
//
//  Created by Quentin Beaudoul on 01/02/2022.
//

import Foundation

class TranslateViewModel {
    var translations: [Translation]?

    func processTranslation(text: String, sourceLang: String? = nil, targetLang: String, completion: @escaping (Result<Bool, Error>) -> Void) {
        TranslateManager.shared.fetchTranslation(text: text, sourceLang: sourceLang, targetLang: targetLang) { translations, error  in
            
            if let error = error {
                return completion(.failure(error))
            }

            if let translations = translations {
                self.translations = translations
                return completion(.success(true))
            }
        }
    }
}
