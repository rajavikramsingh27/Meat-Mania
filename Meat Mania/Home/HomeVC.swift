//
//  HomeVC.swift
//  Meat Mania
//
//  Created by iOS-Appentus on 25/December/2019.
//  Copyright © 2019 appentus. All rights reserved.
//

import UIKit
import SideMenuSwift

class HomeVC: UIViewController ,SideMenuControllerDelegate {
    @IBOutlet weak var innerLogoutView: UIView!
    @IBOutlet weak var topCollectionView: UICollectionView!
    @IBOutlet weak var homeCollectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var logoutView: UIView!
    
    
    
    let arrImgs = ["meat-mania.jpeg","meat-mania.jpeg","meat-mania.jpeg"]
    let productImg = ["download (7).jpeg","images (1).jpeg","images (3).jpeg","images (3).jpeg","images (1).jpeg","download (4).jpeg","download (6).jpeg","download (8).jpeg","download (5).jpeg","download (9).jpeg","images (2).jpeg","download (7).jpeg"]
    let productLbl = ["Deal of the day","Fish","Poultry","Mutton","Marinadas","Combo","Frozon","Pickel","Deal of the day","Fish","Poultry","Mutton"]
    var val = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.numberOfPages = arrImgs.count
        pageControl.transform = CGAffineTransform(scaleX:1.5, y:1.5)
        
        sideMenuController?.delegate = self
        SideMenuController.preferences.basic.menuWidth = 270
        SideMenuController.preferences.basic.statusBarBehavior = .none
        SideMenuController.preferences.basic.position = .above
        SideMenuController.preferences.basic.direction = .left
        SideMenuController.preferences.basic.enablePanGesture = true
        SideMenuController.preferences.basic.shouldRespectLanguageDirection = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    
    @IBAction func menuBttn(_ sender: UIButton) {
      sideMenuController?.revealMenu()
    }
    
    @IBAction func btn_menu(_ sender: UIButton) {
        onSlideMenuButtonPressed(sender)
    }
    
    @IBAction func logoutYesBttn(_ sender: UIButton) {
        NotificationCenter.default.removeObserver(self)
        let vc  = UIStoryboard(name: "Login", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func logoutNoBttn(_ sender: UIButton) {
         logoutView.isHidden = true
    }
    @IBAction func cancelBttn(_ sender: UIButton) {
          logoutView.isHidden = true
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let x = scrollView.contentOffset.x
        let y = scrollView.bounds.size.width
        pageControl.currentPage = Int(ceil(x/y))
    }

    @IBAction func searchBttn(_ sender: UIButton) {
        let vc  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchResultVC") as! SearchResultVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func side_menu_actions( sender : NSNotification){
        let index = sender.userInfo as! [String:Any]
        let index_sel = index["index"] as? Int ?? 0
        
        
        if index_sel == 0 {
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SideMenuController") 
            self.navigationController?.pushViewController(vc, animated: true)
        }else if index_sel == 1{
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "AboutVC") as! AboutVC
            self.navigationController?.pushViewController(vc, animated: true)
        }  else if index_sel == 2{
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TermsAndConditionVC") as! TermsAndConditionVC
            self.navigationController?.pushViewController(vc, animated: true)
        } else if index_sel == 3{
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ContactUSVC") as! ContactUSVC
            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if index_sel == 4{
//            let vc = UIStoryboard.init(name: "jobs", bundle: nil).instantiateViewController(withIdentifier: "HelpAndSupportVC") as! HelpAndSupportVC
//            self.navigationController?.pushViewController(vc, animated: true)
        }
        else if index_sel == 5{
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RewardPointVC") as! RewardPointVC
            self.navigationController?.pushViewController(vc, animated: true)
        } else if index_sel == 6 {
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReferFriendVC") as! ReferFriendVC
            self.navigationController?.pushViewController(vc, animated: true)
        } else if index_sel == 7 {
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ChangePasswordVC") as! ChangePasswordVC
            self.navigationController?.pushViewController(vc, animated: true)
        } else if index_sel == 8 {
            let vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SideMenuController")
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension HomeVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if topCollectionView == collectionView {
            return arrImgs.count
        } else {
            return productImg.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if topCollectionView == collectionView {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCollCell", for: indexPath) as! TopCollCell
            cell.img.image = UIImage(named: arrImgs[indexPath.item])
            return cell
        } else {
            let cell1 = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollCell", for: indexPath) as! HomeCollCell
//            cell1.immgg.image = UIImage(named: productImg[indexPath.item])
//            cell1.productNameLbl.text = productLbl[indexPath.item]
            return cell1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MainHomeVC") as! MainHomeVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.size.height
        let width = collectionView.frame.size.width
        
        if topCollectionView == collectionView {
            return CGSize(width: width, height: height)
        } else {
            return CGSize(width: width/2-5, height:170)
        }
        
    }
    
}


