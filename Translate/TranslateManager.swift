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

    func fetchTranslation(text: String, sourceLang: String? = nil, targetLang: String, completion: @escaping ([Translation]?, Error?) -> Void) {
        let url = Constante.baseUrl

        // TODO: find smartphone language here to replace "sourceLang ?? FR"

        let parameters: [String : Any] = ["auth_key": Constante.apikey, "text": text, "source_lang": sourceLang ?? "FR", "target_lang": targetLang]
        NetworkManager.fetchData(url: url, parameters: parameters, parser: [Translation].self) { result in
            switch result {
            case .success(let translation):
                completion(translation, nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
