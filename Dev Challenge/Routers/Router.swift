//
//  Router.swift
//  Dev Challenge
//
//  Created by Chandan Singh on 11/9/19.
//  Copyright © 2019 Developer005. All rights reserved.
//

import Alamofire

protocol Router {
    var baseUrl: String { get }
    var path: String { get }
    var fullUrl: String { get }
    var method: Alamofire.HTTPMethod { get }
    var routerRequest: URLRequest { get }
}

extension Router {
    var fullUrl: String {
        return baseUrl + path
    }
    
    
    var routerRequest: URLRequest {
        let encodedURL = fullUrl.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        if let unwrappedString = encodedURL, let wrappedURL = URL(string: unwrappedString) {
            var request = URLRequest(url: wrappedURL)
            request.httpMethod = method.rawValue
            request.addValue("application/json", forHTTPHeaderField: "Accept")
            request.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            return request
        } else {
            let request = URLRequest(url: URL(string: Constant.ApiUrl.baseUrl)!)
            return request
        }
    }
}
