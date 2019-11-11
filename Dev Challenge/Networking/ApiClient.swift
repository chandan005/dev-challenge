//
//  ApiClient.swift
//  Dev Challenge
//
//  Created by Chandan Singh on 11/9/19.
//  Copyright © 2019 Developer005. All rights reserved.
//

import Alamofire

final class ApiClient {
    private let queue = DispatchQueue(label: "com.developer005", qos: .utility, attributes: [.concurrent])
    private let sessionManager: SessionManager
    
    init(){
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = SessionManager.defaultHTTPHeaders
        self.sessionManager = SessionManager(configuration: configuration)
    }
    
    func requestResource(withRequest request: URLRequestConvertible, completion: @escaping(Result<Any>) -> ()) {
        sessionManager.request(request).responseJSON(queue: queue) { response in
            switch response.result {
            case .failure(let encodingError):
                print(encodingError.localizedDescription)
                if let internetError = encodingError as? URLError, internetError.code == .notConnectedToInternet {
                    completion(.failure(NetworkError.internetNotConnected))
                } else {
                    completion(.failure(NetworkError.serverNotReachable))
                }
            case .success(let value):
                completion(.success(value))
            }
        }
    }
}

