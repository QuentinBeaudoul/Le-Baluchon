//
//  Service.swift
//  Network
//
//  Created by Quentin Beaudoul on 05/02/2022.
//

import Foundation
import Alamofire

public class Service<T : Decodable> {

    class func get(url: String, header: [String: Any]? = nil, parameters: [String: Any]? = nil, parser: T.Type, completion: @escaping (DataResponse<T, AFError>) -> Void)  {
        let request = AF.request(url, parameters: parameters)
        request.responseDecodable(of: parser, completionHandler: completion)
    }

    class func post(url: String, header: [String: Any]? = nil, parameters: [String: Any], parser: T.Type, completion: @escaping (DataResponse<T, AFError>) -> Void) {
        let request = AF.request(url, method: .post, parameters: parameters)
        request.responseDecodable(of: parser, completionHandler: completion)
    }
}
