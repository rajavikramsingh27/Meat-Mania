//
//  MenuVC.swift
//  Meat Mania
//
//  Created by iOS-Appentus on 25/December/2019.
//  Copyright © 2019 appentus. All rights reserved.
//

import UIKit
import SideMenuSwift

class MenuVC: UIViewController {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    let arrName = ["Home","About","Terms & Conditions","Contact Us","Review Us","Reward Point","Refer a Friend","Change Password","Log Out"]
    let arrImage = ["1home","2about","3terms_condition","4contact_us","5review","basket","7refr","8change_pass","9log_out"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    
    
}
extension MenuVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return arrName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTblCell", for: indexPath) as! MenuTblCell
        cell.menuNameLbl.text = arrName[indexPath.row]
        cell.menuImg.image = UIImage(named: arrImage[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        sideMenuController?.hideMenu()
        if indexPath.row == 8 {
            logoutPart = "Logout"
        } else {
            logoutPart = ""
        }
        NotificationCenter.default.post(name: Notification.Name("side_menu_actions"), object: nil, userInfo: ["index":indexPath.row])
        
       
        
        
        
    }
    
    
}
