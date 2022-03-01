//
//  StubNetworkManager.swift
//  TranslateTests
//
//  Created by Quentin Beaudoul on 01/03/2022.
//

import Foundation
import LBNetwork
@testable import Translate

class StubNetworkManager: NetworkManagerProtocol {
    
    func fetchData<T>(url: String, headers: [String : String]?, parameters: [String : Any]?, parser: T.Type, completion: @escaping (Result<T?, Error>) -> Void) where T : Decodable {

        if let container = Bundle.decode(TranslationContainer.self, from: "Translation.json", in: Bundle(for: Self.self)) as? T {
            completion(.success(container))
            return
        }

        if let container = Bundle.decode(LanguageContainer.self, from: "Languages.json", in: Bundle(for: Self.self)) as? T {
            completion(.success(container))
            return
        }

        completion(.success(nil))
    }
}
