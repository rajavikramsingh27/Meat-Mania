//  File.swift
//  Meat Mania
//  Created by iOS-Appentus on 25/December/2019.
//  Copyright © 2019 appentus. All rights reserved.


import UIKit


@IBDesignable
class Round_Button: UIButton {
    @IBInspectable var borderColor: UIColor = UIColor.white {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 2.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    
    
    
}



