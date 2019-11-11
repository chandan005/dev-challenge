//
//  Double+Helpers.swift
//  Dev Challenge
//
//  Created by Chandan Singh on 11/11/19.
//  Copyright © 2019 Developer005. All rights reserved.
//
import Foundation
extension Double {
    /// Rounds the double to decimal places value
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
