//
//  TranslateManager.swift
//  Translate
//
//  Created by Quentin Beaudoul on 05/02/2022.
//

import UIKit
import LBNetwork
import Extension

public final class TranslateManager {
    public static let shared = TranslateManager()
    private init() {}

    public func getViewController() -> UIViewController {
        let viewController = TranslateViewController.makeFromStoryboard(in: Bundle(for: Self.self))
        viewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "captions.bubble"), selectedImage: UIImage(systemName: "captions.bubble.fill"))

        return viewController
    }

    func fetchTranslation(text: String, sourceLang: String? = nil, targetLang: String, completion: @escaping (Result<TranslationContainer?, Error>) -> Void) {
        let url = Constante.baseUrl

        let parameters: [String : Any] = ["auth_key": Constante.apikey, "text": text, "source_lang": sourceLang ?? getDeviceLang(), "target_lang": targetLang]
        NetworkManager.fetchData(url: url, parameters: parameters, parser: TranslationContainer.self) { result in
            switch result {
            case .success(let translationContainer):
                completion(.success(translationContainer))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getDeviceLang() -> String {
        return Locale.current.languageCode?.capitalized ?? "FR"
    }
}
