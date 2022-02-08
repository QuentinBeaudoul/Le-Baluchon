//
//  NetworkManager.swift
//  Network
//
//  Created by Quentin Beaudoul on 08/02/2022.
//

import Foundation

public class NetworkManager {
    public class func fetchData<T: Decodable>(url: String, header: [String: Any]? = nil, parameters: [String: Any]? = nil, parser: T.Type, completion: @escaping (T?, Error?) -> Void) {
        Service.get(url: url, header: header, parameters: parameters, parser: parser) { response in
            if let error = response.error {
                print("‼️\(error)‼️")
                completion(nil, error)
            } else {
                completion(response.value, nil)
            }
        }
    }

    public class func sendData() {

    }
}
