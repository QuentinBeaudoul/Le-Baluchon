//
//  TranslateViewModel.swift
//  Translate
//
//  Created by Quentin Beaudoul on 01/02/2022.
//

import Foundation

class TranslateViewModel {
    
    private(set) var source: String = TranslateManager.shared.getDeviceLang()
    private(set) var target: String?

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
    
    func swapSourceTraget(safeTarget target: String) {
        let tmp = source
        source = target
        self.target = tmp
    }
    
    func setSource(with choice: String) {
        source = choice
    }
    
    func setTarget(with choice: String?) {
        target = choice
    }
    
    func getSourceLangs() -> [String] {
        return TranslateManager.shared.getSourceLangs() ?? [String]()
    }
    
    func getTargetLangs(for source: String) -> [String] {
        return TranslateManager.shared.getTargetLangs(for: source) ?? [String]()
    }
}
