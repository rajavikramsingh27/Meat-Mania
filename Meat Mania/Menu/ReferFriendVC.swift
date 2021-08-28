//
//  ReferFriendVC.swift
//  Meat Mania
//
//  Created by Uttam on 27/12/19.
//  Copyright © 2019 appentus. All rights reserved.
//

import UIKit

class ReferFriendVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func backBttn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func searchBttn(_ sender: UIButton) {
        let vc  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchResultVC") as! SearchResultVC
        self.navigationController?.pushViewController(vc, animated: true)
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
