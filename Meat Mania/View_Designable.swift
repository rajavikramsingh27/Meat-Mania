//  File.swift
//  Meat Mania
//  Created by iOS-Appentus on 27/December/2019.
//  Copyright © 2019 appentus. All rights reserved.



import Foundation
import UIKit


@IBDesignable class View_Designable: UIView {
    var shadowAdded: Bool = false
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    
    @IBInspectable var border_Width:CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = border_Width
        }
    }
    
    @IBInspectable var border_Color:UIColor = UIColor .clear {
        didSet {
            self.layer.borderColor = border_Color.cgColor
        }
    }

    @IBInspectable var shadow_Radius:CGFloat = 0.0 {
        didSet {
            self.layer.shadowRadius = shadow_Radius
        }
    }
    
    @IBInspectable var shadow_Opacity:Float = 0.0 {
        didSet {
            self.layer.shadowOpacity = shadow_Opacity
        }
    }
    
    @IBInspectable var shadow_Offset:CGSize = CGSize (width: 0, height: 0) {
        didSet {
            self.layer.shadowOffset = shadow_Offset
        }
    }
    
    @IBInspectable var shadow_Color:UIColor = UIColor.clear {
        didSet {
            self.layer.shadowColor = shadow_Color.cgColor
        }
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        if shadowAdded { return }
        shadowAdded = true
        
        let shadowLayer = UIView(frame: self.frame)
        shadowLayer.backgroundColor = UIColor.clear
        shadowLayer.layer.shadowColor = self.shadow_Color.cgColor
        shadowLayer.layer.shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: self.cornerRadius).cgPath
        shadowLayer.layer.shadowOffset = self.shadow_Offset
        shadowLayer.layer.shadowOpacity = self.shadow_Opacity
        shadowLayer.layer.shadowRadius = self.shadow_Radius
        
        shadowLayer.layer.masksToBounds = true
        shadowLayer.clipsToBounds = false
        
        self.superview?.addSubview(shadowLayer)
        self.superview?.bringSubviewToFront(self)
    }
}


