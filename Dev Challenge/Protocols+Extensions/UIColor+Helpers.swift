//
//  UIColor+Helpers.swift
//  Dev Challenge
//
//  Created by Chandan Singh on 11/9/19.
//  Copyright © 2019 Developer005. All rights reserved.
//

import UIKit

extension UIColor {
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Static Properties
    //-------------------------------------------------------------------------------------------
    /**
     Highest value of any rgb elements of the color
     */
    static let colorConstant = CGFloat(255.0)
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Convenient Initializer
    //-------------------------------------------------------------------------------------------
    /**
     Takes hex value of the color and converts it to rgba value
     - Parameter hex: Integer value of the color
     */
    convenience public init(hex: Int) {
        let red = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((hex & 0xFF00) >> 8) / 255.0
        let blue = CGFloat((hex & 0xFF)) / 255.0
        self.init(red:red, green:green, blue:blue, alpha: 1.0)
    }
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Functions
    //-------------------------------------------------------------------------------------------
    
    /**
     Returns UIColor based on the passed rgba value by dividing the values by colorConstant
     - Parameter r: CGFloat type red value of the color.
     - Parameter g: CGFloat type green value of the color.
     - Parameter b: CGFloat type blue value of the color.
     - Parameter b: CGFloat type alpha value of the color.
     - Returns: UIColor
     */
    fileprivate class func RGB(_ r: CGFloat, _ g: CGFloat, _ b: CGFloat, _ a: CGFloat) -> UIColor {
        return UIColor(red: ( r / colorConstant), green: ( g / colorConstant), blue: ( b / colorConstant), alpha: a)
    }
    
    //-------------------------------------------------------------------------------------------
    // MARK: - Public Properties
    //-------------------------------------------------------------------------------------------
    
    public class var system: UIColor {
        return .RGB(0.0 * colorConstant, 0.478 * colorConstant, 1.0 * colorConstant, 1.0)
    }
    
    public class var collectionViewBackgroundColor: UIColor {
        //return .RGB(0.91 * colorConstant, 0.91 * colorConstant, 0.91 * colorConstant, 1.0)
        return .RGB(0.95 * colorConstant, 0.95 * colorConstant, 0.95 * colorConstant, 1.0)
    }
    
    public class var searchBarBackgroundColor: UIColor {
        return .RGB(0.95 * colorConstant, 0.95 * colorConstant, 0.95 * colorConstant, 1.0)
    }
    
    public class var searchBarTextColor: UIColor {
        return .RGB(0.56 * colorConstant, 0.56 * colorConstant, 0.58 * colorConstant, 1.0)
    }
    
    public class var lineDividerColor: UIColor {
        return .RGB(0.51 * colorConstant, 0.51 * colorConstant, 0.51 * colorConstant, 0.2)
    }
    
    public class var appBlackColor: UIColor {
        return .RGB(0 * colorConstant, 0 * colorConstant, 0 * colorConstant, 0.90)
    }
    
}

