//
//  ManageAddressVC.swift
//  Meat Mania
//
//  Created by Uttam on 27/12/19.
//  Copyright © 2019 appentus. All rights reserved.
//

import UIKit

class ManageAddressVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backBttn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }

    @IBAction func addNewAddressBttn(_ sender: UIButton) {
        let vc  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AddDeliveryAddressVC") as! AddDeliveryAddressVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
