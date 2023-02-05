//
//  Extension + UIView.swift
//  Find couple
//
//  Created by Buba on 11.12.2022.
//

import UIKit

extension UILabel {
    func animation() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.duration = 0.6
        animation.fromValue = 0.95
        animation.toValue = 1
        animation.autoreverses = true
        animation.repeatCount = 2
        animation.initialVelocity = 0.5
        animation.damping = 1
        
        layer.add(animation, forKey: nil)
    }
}
