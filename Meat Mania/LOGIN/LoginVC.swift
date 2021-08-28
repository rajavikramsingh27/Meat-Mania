//  ViewController.swift
//  Meat Mania
//  Created by iOS-Appentus on 21/December/2019.
//  Copyright © 2019 appentus. All rights reserved.


import UIKit
import ACFloatingTextfield_Swift


class LoginVC: UIViewController {
    @IBOutlet weak var showPasswordBttn: UIButton!
    @IBOutlet weak var textPassword: ACFloatingTextfield!
    @IBOutlet weak var textMobileNo: ACFloatingTextfield!
    @IBOutlet weak var btn_terms_condition:UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let str_terms_and_condition = func_Attributed_String("By procceding, you agree to ", "Terms and Condition",UIFont .systemFont(ofSize: 15), UIFont .systemFont(ofSize: 15), UIColor.black,hexStringToUIColor("C61C2C"))
        btn_terms_condition.setAttributedTitle(str_terms_and_condition, for: .normal)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        logoutPart = ""
    }
    
    
    @IBAction func showPasswordBttnAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        textPassword.isSecureTextEntry = sender.isSelected
    }
    
    @IBAction func signInBtn(_ sender: UIButton) {
       // loginData()
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomTabViewController") as! CustomTabViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
//        let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SideMenuController")
//        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func createAccountBttn(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func forgetPasswordBttn(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func termsBttn(_ sender: UIButton) {
        
    }
    
    
    
    // Call Api
    func loginData(){
        func_ShowHud()
        if Reachability.isConnectedToNetwork() {
            if callValidation() {
                 
                APIFunc.postAPI(url: baseUrl + "login", parameters: ["user_email" : textMobileNo.text!,"password": textPassword.text!,"user_gcm_code":""]) { (json_Data) in
                    self.func_HideHud()
                    print(json_Data)
//                    if status == "1" {
//                        self.func_ShowHud_Success(with: message)
//                        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CustomTabViewController") as! CustomTabViewController
//                        self.navigationController?.pushViewController(vc, animated: true)
//                    } else {
//                        func_ShowHud_Error(with: message)
//                    }
                }
            }
        }
    }
    
    
    // Call Validation
    func callValidation() -> Bool {
        if textMobileNo.text == "" {
             func_ShowHud_Error(with: "Enter your Mobile")
             return false
        } else if textPassword.text == "" {
             func_ShowHud_Error(with: "Enter your Password")
            return false
        } else if btn_terms_condition.isSelected == false {
             func_ShowHud_Error(with: "Select Terms and Conditions")
            return false
        }
        return true
    }
    
    
}

