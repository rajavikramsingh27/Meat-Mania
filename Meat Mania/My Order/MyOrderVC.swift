//
//  MyOrderVC.swift
//  Meat Mania
//  Created by iOS-Appentus on 25/December/2019.
//  Copyright © 2019 appentus. All rights reserved.


import UIKit
import XLPagerTabStrip
import SideMenuSwift


class MyOrderVC:  ButtonBarPagerTabStripViewController,SideMenuControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        settings.style.buttonBarBackgroundColor = hexStringToUIColor("D33239")
        settings.style.buttonBarItemBackgroundColor = hexStringToUIColor("D33239")
        settings.style.buttonBarItemFont = UIFont .systemFont(ofSize: 16)
        settings.style.selectedBarHeight = 0.2
        // settings.style.buttonBarItemBackgroundColor
        
        settings.style.selectedBarBackgroundColor = UIColor.white
        settings.style.buttonBarMinimumLineSpacing = 0
        settings.style.buttonBarItemTitleColor = UIColor.white
        settings.style.buttonBarItemsShouldFillAvailableWidth = true
        settings.style.buttonBarLeftContentInset = 0
        settings.style.buttonBarRightContentInset = 0
        
        changeCurrentIndexProgressive = { [weak self] (oldCell: ButtonBarViewCell?, newCell: ButtonBarViewCell?, progressPercentage: CGFloat, changeCurrentIndex: Bool, animated: Bool) -> Void in
            guard changeCurrentIndex == true else { return }
            oldCell?.label.textColor = UIColor.black
           newCell?.label.textColor = UIColor.white
        }
        
        sideMenuController?.delegate = self
        SideMenuController.preferences.basic.menuWidth = 270
        SideMenuController.preferences.basic.statusBarBehavior = .none
        SideMenuController.preferences.basic.position = .above
        SideMenuController.preferences.basic.direction = .left
        SideMenuController.preferences.basic.enablePanGesture = true
        //        SideMenuController.preferences.basic.supportedOrientations = .all
        SideMenuController.preferences.basic.shouldRespectLanguageDirection = true
    }
    
    
    @IBAction func btn_menu(_ sender:Any) {
        let sender = UIButton()
        onSlideMenuButtonPressed(sender)
    }
    
    @IBAction func searchBttn(_ sender: UIButton) {
        let vc  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchResultVC") as! SearchResultVC
        self.navigationController?.pushViewController(vc, animated: true)
    }

        @IBAction func menuBtn(_ sender: UIButton) {
           
            sideMenuController?.revealMenu()
        }
        
        
        override func viewControllers(for pagerTabStripController: PagerTabStripViewController) -> [UIViewController] {
            let child1 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AllOrderVC") as! AllOrderVC
            let child2 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CompleteOrderVC") as! CompleteOrderVC
           
            return [child1,child2]
        }

}
