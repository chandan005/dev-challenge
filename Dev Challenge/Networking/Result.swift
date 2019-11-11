//
//  Result.swift
//  Dev Challenge
//
//  Created by Chandan Singh on 11/9/19.
//  Copyright © 2019 Developer005. All rights reserved.
//

import Foundation

enum Result<T> {
    case success(T)
    case failure(Error)
}

extension Result {
    func flatMap<U>(_ transform: (T) -> Result<U>) -> Result<U> {
        switch self {
        case .success(let val): return transform(val)
        case .failure(let e): return .failure(e)
        }
    }
    
    func map<U>(f: (T) -> U) -> Result<U> {
        switch self {
        case .success(let t): return .success(f(t))
        case .failure(let err): return .failure(err)
        }
    }
    func flatMap<U>(f: (T)->Result<U>) -> Result<U> {
        switch self {
        case .success(let t): return f(t)
        case .failure(let err): return .failure(err)
        }
    }
}

