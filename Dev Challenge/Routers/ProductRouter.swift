//
//  ProductRouter.swift
//  Dev Challenge
//
//  Created by Chandan Singh on 11/9/19.
//  Copyright © 2019 Developer005. All rights reserved.
//

import Alamofire

enum ProductRouter {
    case getProducts(next: String)
}

extension ProductRouter: URLRequestConvertible, Router {
    
    var baseUrl: String {
        return Constant.ApiUrl.baseUrl
    }
    
    var path: String {
        switch self {
        case .getProducts(let next):
            return String(next)
        }
    }
    
    var method: Alamofire.HTTPMethod {
        switch self {
        case .getProducts:
            return .get
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .getProducts:
            return nil
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let request = routerRequest
        let encoding = URLEncoding.default
        return try encoding.encode(request, with: parameters)
    }
}

