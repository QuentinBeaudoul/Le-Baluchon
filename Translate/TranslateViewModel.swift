//
//  TranslateViewModel.swift
//  Translate
//
//  Created by Quentin Beaudoul on 01/02/2022.
//

import Foundation

class TranslateViewModel {
    
    var source: String?
    var target: String?

    func processTranslation(text: String, completion: @escaping (Result<String, Error>) -> Void) {
    
        guard let target = target else { return }
        TranslateManager.shared.fetchTranslation(text: text, sourceLang: source, targetLang: target) { result  in
            switch result {
            case .success(let translationsContainer):
                if let translations = translationsContainer?.translations, let text = translations.first?.text {
                    return completion(.success(text))
                }
            case .failure(let error):
                return completion(.failure(error))
            }
        }
    }
    
    func getSourceLangs() -> [String]? {
        return TranslateManager.shared.getSourceLangs()
    }
    
    func getTargetLangs() -> [String]? {
        return TranslateManager.shared.getTargetLangs()
    }
}
