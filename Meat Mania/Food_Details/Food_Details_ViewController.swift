//  Food_Details_ViewController.swift
//  Meat Mania
//  Created by iOS-Appentus on 28/December/2019.
//  Copyright © 2019 appentus. All rights reserved.


import UIKit


class Food_Details_ViewController: UIViewController {
    @IBOutlet weak var btn_title:UIButton!
    @IBOutlet weak var foodNameLbl: UILabel!
    @IBOutlet weak var foodNameImg: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
    @IBOutlet weak var lbl_description: UILabel!
    @IBOutlet weak var lbl_qty_in_cart: UILabel!
    
    @IBOutlet weak var btn_add: UIButton!
//    @IBOutlet weak var btn_plus: UIButton!
    @IBOutlet weak var lbl_increament: UILabel!
    @IBOutlet weak var stack_add_minus: UIStackView!
    
    @IBOutlet weak var height_cart:NSLayoutConstraint!
    @IBOutlet weak var view_cart:UIView!
    
    @IBOutlet weak var lbl_cart_value:UILabel!
    
    var selected_index_path = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn_title.setTitle(arr_Product_List[selected_index_path].productName, for: .normal)
        func_update_UI()
        func_check_cart()
    }
    
    func func_update_UI() {
        let image = arr_Product_List[selected_index_path].productImage
        let url  = URL(string: "\(baseUrl_image)\(image)")
        foodNameImg.sd_setImage(with:url, placeholderImage:default_image)
        
        foodNameLbl.text = arr_Product_List[selected_index_path].productName
        priceLbl.text = "\(rupees_symbol) \(arr_Product_List[selected_index_path].price) / \(arr_Product_List[selected_index_path].unitValue) \(arr_Product_List[selected_index_path].unit)"
        
        lbl_increament.text = arr_Product_List[selected_index_path].increament
        lbl_qty_in_cart.text = "Quantity in Cart:- \(arr_Product_List[selected_index_path].inStock)"
        lbl_description.text = arr_Product_List[selected_index_path].productDescription
        
        if arr_Product_List[selected_index_path].increament == "0" {
            btn_add.isHidden = false
            stack_add_minus.isHidden = true
        } else {
            btn_add.isHidden = true
            stack_add_minus.isHidden = false
        }

    }
    
    @IBAction func btn_back(_ sender:Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btn_add (_ sender:UIButton) {
        arr_Product_List[selected_index_path].increament = "\(Int(arr_Product_List[selected_index_path].increament)!+1)"
        func_update_UI()
        func_check_cart()
    }
    
    @IBAction func btn_minus (_ sender:UIButton) {
        arr_Product_List[selected_index_path].increament = "\(Int(arr_Product_List[selected_index_path].increament)!-1)"
        func_update_UI()
        func_check_cart()
    }
    
    @IBAction func btn_plus (_ sender:UIButton) {
        arr_Product_List[selected_index_path].increament = "\(Int(arr_Product_List[selected_index_path].increament)!+1)"
        func_update_UI()
        func_check_cart()
    }
    
    @IBAction func btn_view_cart(_ sender:Any) {
        let cart_VC = self.storyboard?.instantiateViewController(withIdentifier: "CartVC") as! CartVC
        cart_VC.is_from_view_cart = true
        self.navigationController?.pushViewController(cart_VC, animated:true)
    }
    
    func func_check_cart() {
        var item_count = 0
        var price_count = 0
        
        for i in 0..<arr_Product_List.count {
            if arr_Product_List[i].increament != "0" {
                item_count += 1
                let price_product = Int(arr_Product_List[i].increament)!*Int(arr_Product_List[i].price)!
                price_count = price_count+price_product
            }
        }
        
        if price_count == 0 {
            view_cart.isHidden = true
            height_cart.constant = 0
        } else {
            view_cart.isHidden = false
            if func_iPhone_size() {
                height_cart.constant = 50
            } else {
                height_cart.constant = 80
            }
        }
        
        lbl_cart_value.text = "\(item_count) items | \(rupees_symbol) \(price_count)"
    }
    
}
