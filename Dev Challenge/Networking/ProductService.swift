//
//  ProductService.swift
//  Dev Challenge
//
//  Created by Chandan Singh on 11/9/19.
//  Copyright © 2019 Developer005. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

struct ProductService {
    
    static let client = ApiClient()
    
    static func request(withRequest request: URLRequestConvertible) -> Observable<[Product]> {
        return Observable.create { observer in
            client.requestResource(withRequest: request, completion:  { result in
                var products = [Product]()
                switch result {
                case .success(let value):
                    guard let json = value as? JsonDictionary, let objects = json["objects"] as? [JsonDictionary] else {
                        observer.onError(NetworkError.responseNotJSON)
                        return
                    }
                    guard let next = json["next"] as? String else {
                        observer.onNext(products)
                        return
                    }
                    for object in objects {
                        guard let size = object["size"] as? JsonDictionary else {
                            observer.onError(NetworkError.responseNotJSON)
                            return
                        }
                        guard let productSize = ProductSize.init(data: size) else {
                            observer.onError(NetworkError.responseNotJSON)
                            return
                        }
                        guard let product = Product.init(data: object, size: productSize, nextRequest: next) else {
                            observer.onError(NetworkError.responseNotJSON)
                            return
                        }
                        products.append(product)
                    }
                    observer.onNext(products)
                case .failure(let error):
                    print(error)
                }
            })
             return Disposables.create()
        }
    }
}

//struct ProductService {
//
//    static let client = ApiClient()
//
//    static func getProducts(withRequest request: URLRequestConvertible, completion: @escaping(Result<[Product]>, _ next: String) -> ()) {
//        var products = [Product]()
//        client.requestResource(withRequest: request, completion: { result in
//            switch result {
//            case .success(let value):
//                guard let json = value as? JsonDictionary else {
//                    completion(.failure(NetworkError.responseNotJSON.description), "")
//                    return
//                }
//                guard let objects = json["objects"] as? [JsonDictionary] else {
//                    completion(.failure(NetworkError.responseNotJSON.description), "")
//                    return
//                }
//                guard let nextRequest = json["next"] as? String else {
//                    completion(.success([]), "")
//                    return
//                }
//                for object in objects {
//                    guard let size = object["size"] as? JsonDictionary else {
//                        completion(.failure(NetworkError.responseNotJSON.description), "")
//                        return
//                    }
//                    guard let productSize = ProductSize.init(data: size) else {
//                        completion(.failure(NetworkError.responseNotJSON.description), "")
//                        return
//                    }
//                    guard let product = Product.init(data: object, size: productSize) else {
//                        completion(.failure(NetworkError.responseNotJSON.description), "")
//                        return
//                    }
//                    products.append(product)
//                }
////                products = products.filter({$0.category == "Air Conditioners"})
//                completion(.success(products), nextRequest)
//            case .failure(let error):
//                completion(.failure(error), "")
//            }
//        })
//    }
//}
    
