//
//  Category.swift
//  Dev Challenge
//
//  Created by Chandan Singh on 11/10/19.
//  Copyright © 2019 Developer005. All rights reserved.
//

import Foundation

struct Category {
    let type: String
    let products: [Product]
    
    init(type: String, products: [Product]) {
        self.type = type
        self.products = products
    }
}

