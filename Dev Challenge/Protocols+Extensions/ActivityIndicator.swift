//
//  ActivityIndicator.swift
//  Dev Challenge
//
//  Created by Chandan Singh on 11/9/19.
//  Copyright © 2019 Developer005. All rights reserved.
//

import UIKit

/**
 Hide and show activity indicator
 */
protocol ActivityIndicator {
//    var activityIndicator: CircularLoaderView { get }
    var activityIndicator: UIActivityIndicatorView { get }
    func showActivityIndicator()
    func hideActivityIndicator()
}

/**
 Implementation of Hide and show activity indicator where self is UIViewController
 */
extension ActivityIndicator where Self: UIViewController {
    
    func showActivityIndicator(){
        DispatchQueue.main.async {
            self.activityIndicator.color = UIColor.white
            self.activityIndicator.backgroundColor = UIColor.black.withAlphaComponent(0.75)
            self.activityIndicator.layer.cornerRadius = 10
            self.activityIndicator.frame = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
            self.activityIndicator.center = CGPoint(x: Constant.Device.width / 2, y: Constant.Device.height / 2.5)
            self.activityIndicator.hidesWhenStopped = true
            self.view.addSubview(self.activityIndicator)
            self.activityIndicator.startAnimating()
        }
    }
    
    func hideActivityIndicator(){
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.removeFromSuperview()
        }
    }    
}
