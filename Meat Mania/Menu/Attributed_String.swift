//  Attributed_String.swift
//  Meat Mania
//  Created by iOS-Appentus on 28/December/2019.
//  Copyright © 2019 appentus. All rights reserved.


import Foundation
import UIKit


func func_Attributed_String(_ normal:String,_ attributed:String,_ font_normal:UIFont,_ font_attributed:UIFont,_ color_normal:UIColor,_ color_attributed:UIColor) -> NSAttributedString {
    let string_normal = [NSAttributedString.Key.font :font_normal, NSAttributedString.Key.foregroundColor:color_normal]
    let string_attributed = [NSAttributedString.Key.font :font_attributed, NSAttributedString.Key.foregroundColor:color_attributed]
    
    let attributedString1 = NSMutableAttributedString(string:normal, attributes:string_normal)
    let attributedString2 = NSMutableAttributedString(string:attributed, attributes:string_attributed)
    
    attributedString1.append(attributedString2)
    return attributedString1
}




func hexStringToUIColor (_ hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
        return UIColor.gray
    }
    
    var rgbValue:UInt64 = 0
    Scanner(string: cString).scanHexInt64(&rgbValue)
    
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}
