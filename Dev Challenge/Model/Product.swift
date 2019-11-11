//
//  Product.swift
//  Dev Challenge
//
//  Created by Chandan Singh on 11/9/19.
//  Copyright © 2019 Developer005. All rights reserved.
//

import Foundation

struct Product {
    let category: String
    let title: String
    let weight: Double?
    let size: ProductSize
    let nextRequest: String?
}

extension Product {
    init?(data: JsonDictionary, size: ProductSize, nextRequest: String?) {
        guard let category = data["category"] as? String, let title = data["title"] as? String else { return  nil }
        self.size = size
        self.category = category
        self.title = title
        self.weight = data["weight"] as? Double
        self.nextRequest = nextRequest
    }
}
