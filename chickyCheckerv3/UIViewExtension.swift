//
//  UIViewExtension.swift
//  chickyCheckerv3
//
//  Created by Mac on 5/16/19.
//  Copyright © 2019 Mac. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y: 0.0)
        
        layer.insertSublayer(gradientLayer, at: 0)
        
    }
    
    func setRadius(radius: CGFloat? = nil) {
        
        self.layer.cornerRadius = radius ?? self.frame.height / 2
        self.layer.masksToBounds = true
        
        
    }
    
    func setRadius20(radius: CGFloat? = nil) {
        
        self.layer.cornerRadius = radius ?? 20
        self.layer.masksToBounds = true
        
        
    }
    func setRadius60(radius: CGFloat? = nil) {
        
        self.layer.cornerRadius = radius ?? 60
        self.layer.masksToBounds = true
        
        
    }
    
    
    
    
}

