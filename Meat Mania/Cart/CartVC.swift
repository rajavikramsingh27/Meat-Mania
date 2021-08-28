//  CartVC.swift
//  Meat Mania
//  Created by iOS-Appentus on 25/December/2019.
//  Copyright © 2019 appentus. All rights reserved.


import UIKit
import SideMenuSwift

var arr_cart_products = [Product_List]()

class CartVC: UIViewController,SideMenuControllerDelegate {
    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var cartTblView: UITableView!
    
    @IBOutlet weak var lbl_total:UILabel!
    @IBOutlet weak var lbl_grand_total:UILabel!
    @IBOutlet weak var btn_menu:UIButton!
    
    var is_from_view_cart = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popUpView.isHidden = true

        sideMenuController?.delegate = self
        SideMenuController.preferences.basic.menuWidth = 270
        SideMenuController.preferences.basic.statusBarBehavior = .none
        SideMenuController.preferences.basic.position = .above
        SideMenuController.preferences.basic.direction = .left
        SideMenuController.preferences.basic.enablePanGesture = true
        //        SideMenuController.preferences.basic.supportedOrientations = .all
        SideMenuController.preferences.basic.shouldRespectLanguageDirection = true
        
        if is_from_view_cart {
          btn_menu.setImage(UIImage (named:"back-arrow"), for: .normal)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        for i in 0..<arr_Product_List.count {
            if arr_Product_List[i].increament != "0" {
                arr_cart_products.append(arr_Product_List[i])
            }
        }
        cartTblView.reloadData()
        func_check_cart()
    }
    
    @IBAction func searchBttn(_ sender: UIButton) {
        let vc  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SearchResultVC") as! SearchResultVC
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func checkOutBttn(_ sender: UIButton) {
         popUpView.isHidden = false
    }
    
    @IBAction func menuBtn(_ sender: UIButton) {
        sideMenuController?.revealMenu()
    }
    
    @IBAction func deliverBttn(_ sender: UIButton) {
    
    }
    
    @IBAction func pickUPBttn(_ sender: UIButton) {
    
    }
    
    @IBAction func btn_checkout(_ sender: UIButton) {
        popUpView.isHidden = false
    }
    
    @IBAction func btn_checkout_hide(_ sender: UIButton) {
        popUpView.isHidden = true
    }
    
    @IBAction func btn_menu(_ sender:Any) {
        if is_from_view_cart {
            self.navigationController?.popViewController(animated: true)
        } else {
            let sender = UIButton()
            onSlideMenuButtonPressed(sender)
        }
    }
    
}

extension CartVC: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr_cart_products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CartCell", for: indexPath) as! CartCell
        
        cell.productImg.makeRounded()
        
        let image = arr_cart_products[indexPath.item].productImage
        let url  = URL(string: "\(baseUrl_image)\(image)")
        cell.productImg.sd_setImage(with:url, placeholderImage:default_image)
        
        cell.productNameLbl.text = arr_cart_products[indexPath.item].productName
        cell.productPriceLbl.text = "\(rupees_symbol) \(arr_cart_products[indexPath.item].price) / \(arr_cart_products[indexPath.item].unitValue) \(arr_cart_products[indexPath.item].unit)"
        cell.rewardPointLbl.text = "Reward Point \(arr_cart_products[indexPath.item].rewards)"
        
        let increatement_product = Int(arr_cart_products[indexPath.row].increament)!
        let price_product = Int(arr_cart_products[indexPath.row].price)!
        let full_price_product = increatement_product*price_product
        
        cell.productCalculationLbl.text = "\(increatement_product) \(rupees_symbol)x\(price_product) \(rupees_symbol) \(full_price_product)"
        
        cell.btn_add.tag = indexPath.row
        cell.btn_minus.tag = indexPath.row
        cell.btn_plus.tag = indexPath.row
        cell.cancelBttn.tag = indexPath.row
        
        cell.lbl_increament.text = arr_cart_products[indexPath.row].increament
        cell.btn_add.addTarget(self, action:#selector(btn_add(_:)), for: .touchUpInside)
        cell.btn_minus.addTarget(self, action:#selector(btn_minus(_:)), for: .touchUpInside)
        cell.btn_plus.addTarget(self, action:#selector(btn_plus(_:)), for: .touchUpInside)
        cell.cancelBttn.addTarget(self, action:#selector(btn_cancel_cart(_:)), for: .touchUpInside)
        
        if arr_cart_products[indexPath.item].increament == "0" {
            cell.btn_add.isHidden = false
            cell.stack_add_minus.isHidden = true
        } else {
            cell.btn_add.isHidden = true
            cell.stack_add_minus.isHidden = false
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130
    }
    
    @IBAction func btn_cancel_cart(_ sender:UIButton) {
        let alert = UIAlertController (title: "", message: "Are you sure to remove this item from cart", preferredStyle: .alert)
        
        let no = UIAlertAction (title: "No", style: .cancel) { (action) in
            
        }
        
        let yes = UIAlertAction (title: "Yes", style: .default) { (action) in
            arr_cart_products.remove(at: sender.tag)
            arr_Product_List[sender.tag].increament = "0"
            
            self.cartTblView.reloadData()
            self.func_check_cart()
        }
        
        alert.addAction(no)
        alert.addAction(yes)
        
        alert.view.tintColor = UIColor.red
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func btn_add (_ sender:UIButton) {
        arr_Product_List[sender.tag].increament = "\(Int(arr_Product_List[sender.tag].increament)!+1)"
        arr_cart_products[sender.tag].increament = "\(Int(arr_cart_products[sender.tag].increament)!+1)"
        cartTblView.reloadData()
        func_check_cart()
    }
    
    @IBAction func btn_minus (_ sender:UIButton) {
        arr_Product_List[sender.tag].increament = "\(Int(arr_Product_List[sender.tag].increament)!-1)"
        arr_cart_products[sender.tag].increament = "\(Int(arr_cart_products[sender.tag].increament)!-1)"
        if arr_cart_products[sender.tag].increament == "0" {
            arr_cart_products.remove(at: sender.tag)
            arr_Product_List[sender.tag].increament = "0"
        }
        cartTblView.reloadData()
        func_check_cart()
    }
    
    @IBAction func btn_plus (_ sender:UIButton) {
        arr_Product_List[sender.tag].increament = "\(Int(arr_Product_List[sender.tag].increament)!+1)"
        arr_cart_products[sender.tag].increament = "\(Int(arr_cart_products[sender.tag].increament)!+1)"
        cartTblView.reloadData()
        func_check_cart()
    }
    
    
    func func_check_cart() {
        var price_count = 0
        
        for i in 0..<arr_Product_List.count {
            if arr_Product_List[i].increament != "0" {
                let price_product = Int(arr_Product_List[i].increament)!*Int(arr_Product_List[i].price)!
                price_count = price_count+price_product
            }
        }
        
        lbl_total.text = "\(rupees_symbol) \(price_count)"
        lbl_grand_total.text = " \(rupees_symbol) \(price_count)"
    }
    
}
