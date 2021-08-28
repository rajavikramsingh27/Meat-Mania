//
//  Extension.swift
//  Meat Mania
//
//  Created by iOS-Appentus on 25/December/2019.
//  Copyright © 2019 appentus. All rights reserved.
//

import UIKit
import CDAlertView

extension UITextField {
    
    @IBInspectable var paddingLeft: CGFloat {
        get {
            return leftView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }
    
    @IBInspectable var paddingRight: CGFloat {
        get {
            return rightView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            rightView = paddingView
            rightViewMode = .always
        }
    }
}
extension UIViewController {
    func func_ShowHud() {
        self.loader(type: .load_start, message: "")
    }
    
    func func_ShowHud_Success(with message:String) {
          self.loader(type: .Success_show, message: message)
       // let alert = CDAlertView(title:message, message:"", type:.success)
       // alert.autoHideTime = 2
       // alert.show()
    }
    
    func func_ShowHud_Error(with message:String) {
         self.loader(type: .Error_show, message: message)

    }
    
    func func_HideHud() {
        //hideLoader()
         self.loader(type: .load_stop, message: "")
    }
    
    func func_IsValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    
    func func_iPhone_size() -> Bool {
        let size = Int64(UIScreen.main.nativeBounds.height)
        if "1136" == "\(size)" {
            return true
        } else if "1334" == "\(size)" {
            return true
        } else if "1920" == "\(size)" || "2208" == "\(size)" {
            return true
        } else if "1792" == "\(size)" {
            return false
        } else if "2426" == "\(size)" {
            return false
        } else if "2436" == "\(size)" {
            return false
        } else if "2688" == "\(size)" {
            return false
        } else if "1136" == "\(size)" {
            return false
        } else {
            return false
        }
        
    }

    
}
