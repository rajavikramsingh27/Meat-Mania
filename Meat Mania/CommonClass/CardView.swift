//
//  CardView.swift
//  Meat Mania
//
//  Created by Uttam on 27/12/19.
//  Copyright © 2019 appentus. All rights reserved.
//

import UIKit

@IBDesignable
class CardView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 2
    
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 3
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable var shadowOpacity: Float = 0.5
    
    override func layoutSubviews() {
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
    }
    
}
extension UIImageView {
    
    func makeRounded() {
        
        self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        self.layer.borderColor = UIColor.gray.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
