//
//  NetworkManager.swift
//  Network
//
//  Created by Quentin Beaudoul on 08/02/2022.
//

import Foundation

public class NetworkManager {

    public class func fetchData<T: Decodable>(url: String, header: [String: Any]? = nil, parameters: [String: Any]? = nil, parser: T.Type, completion: @escaping (Result<T?, Error>) -> Void) {
        Service.get(url: url, header: header, parameters: parameters, parser: parser) { response in
            if let error = response.error {
                print("‼️\(error)‼️")
                completion(.failure(error))
            } else {
                completion(.success(response.value))
            }
        }
    }

    public class func sendData() {

    }
}
