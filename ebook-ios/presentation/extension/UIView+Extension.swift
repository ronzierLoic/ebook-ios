//
//  UIView+Extension.swift
//  ebook-ios
//
//  Created by Loic RONZIER on 03/03/2021.
//  Copyright © 2021 Loic RONZIER. All rights reserved.
//

import UIKit

extension UIView {
    /// Apply corner radius on the view
    ///
    /// - Parameters withRadius: Radius of corner
    func applyCornerRadius(withRadius radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
    
    /// Apply a circle render on the view
    func applyCircleRender() {
        self.layer.cornerRadius = self.frame.height / 2
    }

    /// Add shake animation
    ///
    /// - Parameters:
    ///     - count: Number of shake
    ///     - duration: Duration of shake animation
    ///     - translation: Translation of shake animation
    func shakeError(
        count: Float = 2,
        for duration: TimeInterval = 0.2,
        withTranslation translation: Float = 3
    ) {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.repeatCount = count
        animation.duration = duration / TimeInterval(animation.repeatCount)
        animation.autoreverses = true
        animation.values = [translation, -translation]
        layer.add(animation, forKey: "shake")
    }
    
}
