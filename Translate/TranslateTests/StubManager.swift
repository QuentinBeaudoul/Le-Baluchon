//
//  StubManager.swift
//  TranslateTests
//
//  Created by Quentin on 24/02/2022.
//

import Foundation
import Extension
@testable import Translate

class StubManager: TranslateManagerProtocol {
    
    func fetchTranslation(text: String, sourceLang: String?, targetLang: String, completion: @escaping (Result<TranslationContainer?, Error>) -> Void) {
        
        let translation = Bundle.decode(TranslationContainer.self, from: "Translation.json", in: Bundle(for: Self.self))
        
        completion(.success(translation))
    }
    
    func getDeviceLang() -> String {
        return "Fr"
    }
    
    func getSourceLangs() -> [String]? {
        return ["Fr", "En", "Es", "De"]
    }
    
    func getTargetLangs(for source: String) -> [String]? {
        return nil
    }
    
    func getLiteralName(for lang: String) -> String {
        return Constante.langDic[lang] ?? lang
    }
    
    func getNameFromLiteral(for literalName: String) -> String {
        return String(literalName.prefix(2))
    }
    
}
