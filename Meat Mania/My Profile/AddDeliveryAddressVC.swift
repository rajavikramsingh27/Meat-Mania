//
//  AddDeliveryAddressVC.swift
//  Meat Mania
//
//  Created by Uttam on 27/12/19.
//  Copyright © 2019 appentus. All rights reserved.
//

import UIKit

class AddDeliveryAddressVC: UIViewController {

    @IBOutlet weak var addDeliveryTblView: UITableView!
    let titleArr = ["Receiver Name(Required)","Receiver Mobile Number(Required)","Pincode/Area Code/Zip (Required)","Area","House Number(Required)","Landmark(Required)"]
    override func viewDidLoad() {
        super.viewDidLoad()

      addDeliveryTblView.register(UINib(nibName: "ManageUpdateCell", bundle: nil), forCellReuseIdentifier: "ManageUpdateCell")
        addDeliveryTblView.tableFooterView = UIView()
    }
    @IBAction func backBttn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
  

}

extension AddDeliveryAddressVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count + 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 6 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ManageUpdateCell", for: indexPath) as! ManageUpdateCell
            cell.updateProfileBttn.setTitle("Add delivery address", for: .normal)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddDeliveryCell", for: indexPath) as! AddDeliveryCell
            cell.titleLbl.text = titleArr[indexPath.row]
            if indexPath.row == 3 {
                 cell.nameText.isUserInteractionEnabled = false
                cell.arrowImg.isHidden = false
                let recognizer = UITapGestureRecognizer(target: self, action: #selector(tabEdit(recognizer:)))
               
                cell.addGestureRecognizer(recognizer)
            } else {
                cell.nameText.isUserInteractionEnabled = true
                cell.arrowImg.isHidden = true
            }
            return cell
        }
    }
    @objc func tabEdit(recognizer: UITapGestureRecognizer) {
        let vc  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AreaVC") as! AreaVC
        self.navigationController?.pushViewController(vc, animated: true)

    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
         if indexPath.row == 6 {
            return 55.0
         } else {
            return 86.0
        }
    }
}
