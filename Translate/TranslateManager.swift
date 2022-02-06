//
//  TranslateManager.swift
//  Translate
//
//  Created by Quentin Beaudoul on 05/02/2022.
//

import UIKit
import Network

public final class TranslateManager {
    public static let shared = TranslateManager()
    private init() {}

    public func getViewController() -> UIViewController {
        let viewController = TranslateViewController()
        viewController.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "captions.bubble"), selectedImage: UIImage(systemName: "captions.bubble.fill"))

        return viewController
    }

    public func fetchResult(text: String, sourceLang: String? = nil, targetLang: String, completion: Result<[Translation], NSError>) {
        let url = Constante.baseUrl
        let parameters = ["text": text, "source_lang": sourceLang, "target_lang": targetLang]

        Service<Translation>.get(url: url, parameters: parameters, parser: Translation.Type) { (result, error) in
            if let result = result as? [Translation] {
                // TODO: Impl 
            }
        }

    }
}
