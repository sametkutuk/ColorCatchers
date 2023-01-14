//
//  shakeLabel.swift
//  Color Catchers
//
//  Created by Samet Kutuk on 30.05.2020.
//  Copyright © 2020 Samet Kutuk. All rights reserved.
//

import UIKit

class shakeLabel: UILabel {
    // Added this function to vibrate labels
    func shakeLabel() {
        let animation = CABasicAnimation(keyPath: "position")
        
        // Moves 0.05 seconds
        animation.duration = 0.05
        //Repeat 5 times
        animation.repeatCount = 5
        // After animation go back to your place after animation
        animation.autoreverses = true
        // Moves on the x axis
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x -  7, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x +  7, y: self.center.y))
        self.layer.add(animation, forKey: "position")


    }


}
