//
//  ProductCollectionViewCellModel.swift
//  Dev Challenge
//
//  Created by Chandan Singh on 11/9/19.
//  Copyright © 2019 Developer005. All rights reserved.
//

import Foundation

final class ProductCollectionViewCellModel {
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Properties
    //-------------------------------------------------------------------------------------------
    private var product: Product
    
    var title: String {
        return product.title
    }
    
    var category: String {
        return product.category
    }
    
    var cubicWeight: Double {
        guard let width = product.size.width, let length = product.size.length, let height = product.size.height else {
            return 0.0
        }
        let cubicWeight = ((width/100) * (height/100) * (length/100) ) * 250
        return cubicWeight.rounded(toPlaces: 3)
    }
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Initializer
    //-------------------------------------------------------------------------------------------
    init(_ product: Product) {
        self.product = product
    }
    
}

