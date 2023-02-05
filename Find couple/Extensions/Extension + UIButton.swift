//
//  Extension + UIButton.swift
//  Find couple
//
//  Created by Buba on 04.02.2023.
//

import UIKit

extension UIButton {
    func animation() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.duration = 1
        animation.fromValue = 0.95
        animation.toValue = 1
        animation.damping = 0.2
        
        layer.add(animation, forKey: nil)
    }
}
