//
//  ProductSize.swift
//  Dev Challenge
//
//  Created by Chandan Singh on 11/9/19.
//  Copyright © 2019 Developer005. All rights reserved.
//

import Foundation

struct ProductSize {
    let width: Double?
    let length: Double?
    let height: Double?
}

extension ProductSize {
    init?(data: JsonDictionary) {
        self.width = data["width"] as? Double
        self.length = data["length"] as? Double
        self.height = data["height"] as? Double
    }
    

}
