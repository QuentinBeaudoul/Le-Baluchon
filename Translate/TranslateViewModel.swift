//
//  TranslateViewModel.swift
//  Translate
//
//  Created by Quentin Beaudoul on 01/02/2022.
//

import Foundation
import LBNetwork

class TranslateViewModel {
    
    private(set) var source: String = TranslateManager.shared.getDeviceLang()
    private(set) var target: String?
    
    let manager: TranslateManagerProtocol
    
    init(manager: TranslateManagerProtocol = TranslateManager.shared) {
        self.manager = manager
        source = manager.getDeviceLang()
    }

    func processTranslation(text: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let target = target else { return }
        manager.fetchTranslation(text: text, sourceLang: source, targetLang: target) { result  in
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
        return manager.getSourceLangs() ?? [String]()
    }
    
    func getTargetLangs(for source: String) -> [String] {
        return manager.getTargetLangs(for: source) ?? [String]()
    }
}
