//
//  MenuViewController.swift
//  Meat Mania
//
//  Created by iOS-Appentus on 28/December/2019.
//  Copyright © 2019 appentus. All rights reserved.
//


import UIKit
import CoreData


var arr_select = [false,false,false,false,false,false,false,false]


protocol SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex_menu(_ index : Int32)
}

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var btnCloseMenuOverlay : UIButton!
    @IBOutlet var tbl_menu:UITableView!
    
    /**
     *  Array containing menu options
     */
    
    let arrName = ["Home","About","Terms & Conditions","Contact Us","Review Us","Reward Point","Refer a Friend","Change Password","Log Out"]
    let arrImage = ["1home","2about","3terms_condition","4contact_us","5review","basket","7refr","8change_pass","9log_out"]
    

    
    /**
     *  Menu button which was tapped to display the menu
     */
    
    var btnMenu : UIButton!
    
    /**
     *  Delegate of the MenuVC
     */
    
    var delegate : SlideMenuDelegate?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        updateArrayMenuOptions()
    }
    
    func updateArrayMenuOptions() {
        //        tblMenuOptions.reloadData()
    }
    
    @IBAction func onCloseMenuClick(_ button:UIButton!){
        btnMenu.tag = 0
        
        if (self.delegate != nil) {
            var index = Int32(button.tag)
            if(button == self.btnCloseMenuOverlay){
                index = -1
            }
            delegate?.slideMenuItemSelectedAtIndex_menu(index)
        }
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            self.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width,height: UIScreen.main.bounds.size.height)
            self.view.layoutIfNeeded()
            self.view.backgroundColor = UIColor.clear
        }, completion: { (finished) -> Void in
            self.view.removeFromSuperview()
            self.removeFromParent()
            //                self.removeFromParent()
        })
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 51
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        
        let img_title = cell.viewWithTag(1) as! UIImageView
        let lbl_title = cell.viewWithTag(2) as! UILabel
        
        img_title.image = UIImage (named:arrImage[indexPath.row])
        lbl_title.text = arrName[indexPath.row]
        
        return cell
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let btn = UIButton (type: UIButton.ButtonType.custom)
        btn.tag = indexPath.row
        
        if indexPath.row == 0 {
            self.onCloseMenuClick(btn)
//            if !func_same_vc(identifier: "HomeVC") {
//                func_Go_To_Next("HomeVC")
//            }
        } else if indexPath.row == 1 {
            self.onCloseMenuClick(btn)
            if !func_same_vc(identifier: "AboutVC") {
                func_Go_To_Next("AboutVC")
            }
        } else if indexPath.row == 2 {
            self.onCloseMenuClick(btn)
            if !func_same_vc(identifier: "TermsAndConditionVC") {
                func_Go_To_Next("TermsAndConditionVC")
            }
        } else if indexPath.row == 3 {
            self.onCloseMenuClick(btn)
            if !func_same_vc(identifier: "ContactUSVC") {
                func_Go_To_Next("ContactUSVC")
            }
        } else if indexPath.row == 4 {
            self.onCloseMenuClick(btn)
//            if !func_same_vc(identifier: "RewardPointVC") {
//                func_Go_To_Next("RewardPointVC")
//            }
        }  else if indexPath.row == 5 {
            self.onCloseMenuClick(btn)
            if !func_same_vc(identifier: "RewardPointVC") {
                func_Go_To_Next("RewardPointVC")
            }
        } else if indexPath.row == 6 {
            self.onCloseMenuClick(btn)
//            if !func_same_vc(identifier: "More_ViewController") {
//                func_Go_To_Next("RewardPointVC")
//            }
        }  else if indexPath.row == 7 {
            self.onCloseMenuClick(btn)
            if !func_same_vc(identifier: "ChangePasswordVC") {
                func_Go_To_Next("ChangePasswordVC")
            }
        } else if indexPath.row == arrName.count-1 {
            let alert = UIAlertController (title: "Warning!", message: "Do you want to logout?", preferredStyle: .alert)
            let yes = UIAlertAction(title: "Yes", style: .default) { (yes) in
                
            }
            
            let no = UIAlertAction(title: "No", style: .cancel) { (yes) in
                
            }
            
            alert.addAction(yes)
            alert.addAction(no)
            
            alert.view.tintColor = UIColor .black
            present(alert, animated: true, completion: nil)
        }
    }
    
    func func_Go_To_Next(_ identifier:String) {
        let next_VC = storyboard?.instantiateViewController(withIdentifier:identifier)
//        present(next_VC!, animated: true, completion: nil)
        self.navigationController?.pushViewController(next_VC!, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrName.count
    }
    
    
    
    func removeImageLocalPath(localPathName:String) {
        let filemanager = FileManager.default
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask,true)[0] as NSString
        let destinationPath = documentsPath.appendingPathComponent(localPathName)
        do {
            try filemanager.removeItem(atPath: destinationPath)
            print("Local path removed successfully")
        } catch let error as NSError {
            print("------Error",error.debugDescription)
        }
    }
    
    func getDirectoryPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
//    @available(iOS 10.0, *)
//    func fun_present_exercise_VC() {
//        let appdelgateObj = UIApplication.shared.delegate as! AppDelegate
//        let storyboard = UIStoryboard (name: "Main", bundle: nil)
//        if let destinationVC = storyboard.instantiateViewController(withIdentifier: "Exercise_ViewController") as? Exercise_ViewController {
//            if let window = appdelgateObj.window , let rootViewController = window.rootViewController {
//                var currentController = rootViewController
//
//                while let presentedController = currentController.presentedViewController {
//                    currentController = presentedController
//                }
//
//                if currentController == appdelgateObj.window!.visibleViewController {
//                    print("same view controller")
//                } else {
//                    currentController.present(destinationVC, animated: true, completion: nil)
//                }
//
//            }
//        }
//    }
    
}



import UIKit

extension UIViewController:SlideMenuDelegate {
    func slideMenuItemSelectedAtIndex_menu(_ index: Int32) {
        //        let topViewController : UIViewController = self.navigationController!.topViewController!
        //        print("View Controller is : \(topViewController) \n", terminator: "")
        switch(index){
        case 0:
            print("Home\n", terminator: "")
            break
        case 1:
            print("Play\n", terminator: "")
            break
        default:
            print("default\n", terminator: "")
        }
    }
    
    func openViewControllerBasedOnIdentifier_menu(_ strIdentifier:String){
        let destViewController : UIViewController = self.storyboard!.instantiateViewController(withIdentifier: strIdentifier)
        
        let topViewController : UIViewController = self.navigationController!.topViewController!
        
        if (topViewController.restorationIdentifier! == destViewController.restorationIdentifier!){
            print("Same VC")
        } else {
            self.navigationController!.pushViewController(destViewController, animated: true)
        }
    }
    
    func defaultMenuImage_menu() -> UIImage {
        var defaultMenuImage_menu = UIImage()
        
        UIGraphicsBeginImageContextWithOptions(CGSize(width: 30, height: 22), false, 0.0)
        
        UIColor.black.setFill()
        UIBezierPath(rect: CGRect(x: 0, y: 3, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 10, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 17, width: 30, height: 1)).fill()
        
        UIColor.white.setFill()
        UIBezierPath(rect: CGRect(x: 0, y: 4, width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 11,  width: 30, height: 1)).fill()
        UIBezierPath(rect: CGRect(x: 0, y: 18, width: 30, height: 1)).fill()
        
        defaultMenuImage_menu = UIGraphicsGetImageFromCurrentImageContext()!
        
        UIGraphicsEndImageContext()
        
        return defaultMenuImage_menu;
    }
    
    @objc func onSlideMenuButtonPressed(_ sender : UIButton){
        if (sender.tag == 10)
        {
            // To Hide Menu If it already there
            self.slideMenuItemSelectedAtIndex_menu(-1);
            
            sender.tag = 0;
            
            let viewMenuBack : UIView = view.subviews.last!
            
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                var frameMenu : CGRect = viewMenuBack.frame
                frameMenu.origin.x = -1 * UIScreen.main.bounds.size.width
                viewMenuBack.frame = frameMenu
                viewMenuBack.layoutIfNeeded()
                viewMenuBack.backgroundColor = UIColor.clear
            }, completion: { (finished) -> Void in
                viewMenuBack.removeFromSuperview()
            })
            
            return
        }
        
        sender.isEnabled = false
        sender.tag = 10
        
        let menuVC : MenuViewController = self.storyboard!.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        menuVC.btnMenu = sender
        menuVC.delegate = self
        self.view.addSubview(menuVC.view)
        self.addChild(menuVC)
        menuVC.view.bringSubviewToFront(self.view)
//        self.tabBarController?.tabBar.isHidden = true
        //        self.addChild(menuVC)
        menuVC.view.layoutIfNeeded()
        
        menuVC.view.frame=CGRect(x: 0 - UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
        
        UIView.animate(withDuration: 0.3, animations: { () -> Void in
            menuVC.view.frame=CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height);
            sender.isEnabled = true
        }, completion:nil)
    }
}


extension CALayer {
    func addBorder(edge: UIRectEdge, color: UIColor, thickness: CGFloat) {
        
        let border = CALayer()
        
        switch edge {
        case UIRectEdge.top:
            border.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: thickness)
            
        case UIRectEdge.bottom:
            border.frame = CGRect(x: 0, y: self.bounds.height - thickness,  width: UIScreen.main.bounds.width, height: thickness)
            
        case UIRectEdge.left:
            border.frame = CGRect(x: 0, y: 0,  width: thickness, height: self.bounds.height)
            
        case UIRectEdge.right:
            border.frame = CGRect(x: self.bounds.width - thickness, y: 0,  width: thickness, height: self.bounds.height)
        default:
            print("nothing")
        }
        
        border.backgroundColor = color.cgColor;
        self.addSublayer(border)
    }
    
}

extension MenuViewController {
    func func_same_vc(identifier:String) -> Bool {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyBoard.instantiateViewController(withIdentifier: identifier)
        
        let class_name = "\(viewController.classForCoder)"
        let class_name_now = "\(UIApplication.topViewController()!.classForCoder)"
        
        if class_name == class_name_now {
            return true
        } else {
            return false
        }
        
    }
    
}

extension UIApplication {
    
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            let moreNavigationController = tab.moreNavigationController
            
            if let top = moreNavigationController.topViewController, top.view.window != nil {
                return topViewController(base: top)
            } else if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        return base
    }
}



