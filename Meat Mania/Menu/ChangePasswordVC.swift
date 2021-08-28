//
//  ChangePasswordVC.swift
//  Meat Mania
//
//  Created by Uttam on 27/12/19.
//  Copyright © 2019 appentus. All rights reserved.
//

import UIKit
import  ACFloatingTextfield_Swift

class ChangePasswordVC: UIViewController {

    @IBOutlet weak var newPasswordText: ACFloatingTextfield!
    @IBOutlet weak var oldPasswordText: ACFloatingTextfield!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func submitBttn(_ sender: UIButton) {
    }
    @IBAction func oldShowPasswordBttn(_ sender: Any) {
    }
    @IBAction func newShowPasswordBttn(_ sender: UIButton) {
    }
    @IBAction func backBttn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
