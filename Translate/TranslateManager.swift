//
//  TranslateManager.swift
//  Translate
//
//  Created by Quentin Beaudoul on 05/02/2022.
//

import UIKit
import LBNetwork
import Extension

protocol TranslateManagerProtocol {

    var manager: NetworkManagerProtocol { get set}
    init(manager: NetworkManagerProtocol)
    func fetchLanguages(completion: @escaping (Result<LanguageContainer?, Error>) -> Void)
    func fetchTranslation(text: String, sourceLang: String?, targetLang: String, completion: @escaping (Result<TranslationContainer?, Error>) -> Void)
    func getDeviceLang() -> String
    func getSourceLangs() -> [String]?
    func getTargetLangs(for source: String) -> [String]?
    func getLiteralName(for lang: String) -> String
    func getNameFromLiteral(for literalName: String) -> String
}

public final class TranslateManager: TranslateManagerProtocol {

    public static let shared = TranslateManager()

    var manager: NetworkManagerProtocol
    var languages: [Language]?
    
    init(manager: NetworkManagerProtocol = NetworkManager.shared) {
        self.manager = manager
    }

    public func getViewController() -> UIViewController {
        let viewController = TranslateViewController.makeFromStoryboard(in: Bundle(for: Self.self))
        if #available(iOS 13.0, *) {
            viewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "captions.bubble"), selectedImage: UIImage(systemName: "captions.bubble.fill"))
        } else {
            let image = R.image.ic_24_translate()
            let selected = R.image.ic_24_translate_fill()
            viewController.tabBarItem = UITabBarItem(title: "", image: image, selectedImage: selected)
        }

        return viewController
    }
    
    public func fetchLanguages(completion: @escaping (Result<LanguageContainer?, Error>) -> Void) {
        let url = Constante.languagesUrl
        let header = ["Authorization": Constante.authorization]
        
        manager.fetchData(url: url, headers: header, parameters: nil, parser: LanguageContainer.self) { result in
            switch result {
            case .success(let container):
                self.languages = container?.languages
                completion(.success(container))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    func fetchTranslation(text: String, sourceLang: String? = nil, targetLang: String, completion: @escaping (Result<TranslationContainer?, Error>) -> Void) {
        let url = Constante.translateUrl

        let parameters: [String : Any] = ["auth_key": Constante.apikey, "text": text, "source_lang": sourceLang ?? getDeviceLang(), "target_lang": targetLang]
        manager.fetchData(url: url, headers: nil, parameters: parameters, parser: TranslationContainer.self) { result in
            switch result {
            case .success(let translationContainer):
                completion(.success(translationContainer))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getDeviceLang() -> String {
        return Locale.current.languageCode?.capitalized ?? "Fr"
    }
    
    func getSourceLangs() -> [String]? {
        guard let languages = languages else { return nil }
        return Array(Set(languages.map { lang in
            lang.sourceLang
        }))
    }
    
    func getTargetLangs(for source: String) -> [String]? {
        guard let languages = languages else { return nil }
        return languages.filter { lang in
            lang.sourceLang == source
        }.map { lang in
            lang.targetLang
        }
    }
    
    func getLiteralName(for lang: String) -> String {
        return Constante.langDic[lang] ?? lang
    }
    
    func getNameFromLiteral(for literalName: String) -> String {
        return String(literalName.prefix(2))
    }
}
