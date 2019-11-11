//
//  NetworkError.swift
//  Dev Challenge
//
//  Created by Chandan Singh on 11/9/19.
//  Copyright © 2019 Developer005. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case internetNotConnected
    case serverNotReachable
    case responseNotJSON
}

extension NetworkError: CustomStringConvertible {
    var description: String {
        switch self {
        case .internetNotConnected: return "Please check your internet connection."
        case .serverNotReachable: return "There was an issue connecting to the server. Please try again later."
        case .responseNotJSON: return "Bad response."
        }
    }
}


extension NetworkError: LocalizedError {
    var localizedDescription: String {
        switch self {
        case .internetNotConnected: return NSLocalizedString("Please check your internet connection.", comment: "")
        case .serverNotReachable: return NSLocalizedString("There was an issue connecting to the server. Please try again later.", comment: "")
        case .responseNotJSON: return NSLocalizedString("Bad response.", comment: "")
        }
    }
    
    var errorDescription: String? {
        return localizedDescription
    }
}

