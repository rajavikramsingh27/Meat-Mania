//  SignUpVC.swift
//  Meat Mania
//  Created by iOS-Appentus on 25/December/2019.
//  Copyright © 2019 appentus. All rights reserved.


import UIKit
import ACFloatingTextfield_Swift


class SignUpVC: UIViewController {
    @IBOutlet weak var textPassword: ACFloatingTextfield!
    @IBOutlet weak var btn_already_sign:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let str_terms_and_condition = func_Attributed_String("Already i have account ? ", "Sign In",UIFont .systemFont(ofSize: 15), UIFont .systemFont(ofSize: 15), UIColor.black,hexStringToUIColor("C61C2C"))
        btn_already_sign.setAttributedTitle(str_terms_and_condition, for: .normal)
    }
    
    @IBAction func btn_back(_ sender:UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func showPasswordBttnAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        textPassword.isSecureTextEntry = sender.isSelected
    }
    
}
