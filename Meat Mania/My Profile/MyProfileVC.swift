//
//  MyProfileVC.swift
//  Meat Mania
//
//  Created by iOS-Appentus on 25/December/2019.
//  Copyright © 2019 appentus. All rights reserved.
//

import UIKit
import SideMenuSwift

class MyProfileVC: UIViewController,SideMenuControllerDelegate {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenuController?.delegate = self
        SideMenuController.preferences.basic.menuWidth = 270
        SideMenuController.preferences.basic.statusBarBehavior = .none
        SideMenuController.preferences.basic.position = .above
        SideMenuController.preferences.basic.direction = .left
        SideMenuController.preferences.basic.enablePanGesture = true
        //        SideMenuController.preferences.basic.supportedOrientations = .all
        SideMenuController.preferences.basic.shouldRespectLanguageDirection = true
        
    }
    
    @IBAction func searchBttn(_ sender: UIButton) {
        let vc  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchResultVC") as! SearchResultVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func btn_menu(_ sender:Any) {
        let sender = UIButton()
        onSlideMenuButtonPressed(sender)
    }
    
    @IBAction func manageAddressBttn(_ sender: UIButton) {
        let vc  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ManageAddressVC") as! ManageAddressVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func manageProfileBttn(_ sender: UIButton) {
        let vc  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ManageProfileVC") as! ManageProfileVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
