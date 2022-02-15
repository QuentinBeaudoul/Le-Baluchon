//
//  NetworkManager.swift
//  Network
//
//  Created by Quentin Beaudoul on 08/02/2022.
//

import Foundation
import Alamofire

public class NetworkManager {

    public class func fetchData<T: Decodable>(url: String, headers: [String: String]? = nil, parameters: [String: Any]? = nil, parser: T.Type, completion: @escaping (Result<T?, Error>) -> Void) {
        
        var afHeaders = HTTPHeaders()
        if let headers = headers {
            for header in headers {
                afHeaders.add(name: header.key, value: header.value)
            }
        }
        
        Service.get(url: url, headers: afHeaders, parameters: parameters, parser: parser) { response in
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
