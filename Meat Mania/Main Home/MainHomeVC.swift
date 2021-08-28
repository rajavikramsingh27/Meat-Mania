//  MainHomeVC.swift
//  Meat Mania
//  Created by Uttam on 26/12/19.
//  Copyright © 2019 appentus. All rights reserved.


import UIKit
import SDWebImage

class MainHomeVC: UIViewController {
    
    @IBOutlet weak var mainCollView: UICollectionView!
    @IBOutlet weak var topTitleCollView: UICollectionView!
    @IBOutlet weak var titleNameLbl: UILabel!
   
    @IBOutlet weak var height_cart:NSLayoutConstraint!
    @IBOutlet weak var view_cart:UIView!
    
    @IBOutlet weak var lbl_cart_value:UILabel!
    
    
    
    var arr_select_header = [Bool]()
    var categoryId: String = ""
    var categoryBool: Bool = false
    let arrImg = ["f1","chicken","goat","kebab","f1","chicken","goat"]
    let arrLbl = ["Fish","Poultry","Mutton","Marinades","Combo","Frozon","Pickel"]
    
    let productImg = ["download (7).jpeg","images (1).jpeg","images (3).jpeg","images (3).jpeg","images (1).jpeg","download (4).jpeg","download (6).jpeg","download (8).jpeg","download (5).jpeg","download (9).jpeg","images (2).jpeg","download (7).jpeg"]
    let productLbl = ["Katla (Farm Fish)","Rahu","Katla (Farm Fish)","Rahu","Katla (Farm Fish)","Rahu","Katla (Farm Fish)","Rahu","Katla (Farm Fish)","Rahu","Katla (Farm Fish)","Rahu"]
    
    let priceLbl = ["$ 546/1 KG","$ 546/1 KG","$ 546/1 KG","$ 546/1 KG","$ 546/1 KG","$ 546/1 KG","$ 546/1 KG","$ 546/1 KG","$ 546/1 KG","$ 546/1 KG","$ 546/1 KG","$ 546/1 KG"]
    let selectedArr =  NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        topTitleCollView.delegate = self
        topTitleCollView.dataSource = self
        
        for i in 0..<arrLbl.count {
            if i == 0 {
                arr_select_header.append(true)
            } else {
                arr_select_header.append(false)
            }
        }
        topTitleCollView.reloadData()
        
        func_getCategoryData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        func_check_cart()
        mainCollView.reloadData()
    }
  
    @IBAction func backBttn(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    
    // Call Api
    func func_getCategoryData() {
        self.func_ShowHud()
            sendRequestToServerGet(url: "get_categories", success: { (jsonDict) in
                print(jsonDict)
                if jsonDict["responce"] == true {
                    let decoder = JSONDecoder()
                    if let jsonData = jsonDict["data"].description.data(using: .utf8) {
                        do {
                            mealCategory = try decoder.decode([Category].self, from: jsonData)
                        } catch {
                            
                        }
                    }
                    DispatchQueue.main.async {
                        self.func_HideHud()
                        self.topTitleCollView.reloadData()
                        self.func_get_products(mealCategory[0].id,"")
                    }
                }
            }) { (msg) in
                
            }
    }
    
    func func_get_products(_ cat_id:String,_ search:String) {
        self.func_ShowHud()
        let param = ["cat_id":cat_id,"search":search]
        sendRequestToServerPost(url: "get_products", parameters: param, success: { (jsonDict) in
            if jsonDict["responce"] == true {
                let decoder = JSONDecoder()
                if let jsonData = jsonDict["data"].description.data(using: .utf8) {
                    do {
                         arr_Product_List = try decoder.decode([Product_List].self, from: jsonData)
                    } catch {
                        print(error.localizedDescription)
                    }
                }
                DispatchQueue.main.async {
                    self.func_HideHud()
                    self.mainCollView.reloadData()
                }
            }
            
        }) { (msg) in
            
        }
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
    
    @IBAction func btn_view_cart(_ sender:Any) {
        let cart_VC = self.storyboard?.instantiateViewController(withIdentifier: "CartVC") as! CartVC
        cart_VC.is_from_view_cart = true
        self.navigationController?.pushViewController(cart_VC, animated:true)
    }
    
}

    

extension MainHomeVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if topTitleCollView == collectionView {
            return mealCategory.count
        } else {
            return arr_Product_List.count
        }
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if topTitleCollView == collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainTopCollCell", for: indexPath) as! MainTopCollCell
            
            cell.titleImg.image = UIImage(named: arrImg[indexPath.item])
            cell.titleNameLbl.text = mealCategory[indexPath.item].title
            
            let url  = URL(string: "\(baseUrl_image)\(mealCategory[indexPath.item].icon)")
//            cell.titleImg.sd_setImage(with:url, placeholderImage:default_image)
            
            cell.selectedLineLbl.isHidden = !arr_select_header[indexPath.row]
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollCell", for: indexPath) as! MainCollCell
            
            let image = arr_Product_List[indexPath.item].productImage
            let url  = URL(string: "\(baseUrl_image)\(image)")
            cell.foodNameImg.sd_setImage(with:url, placeholderImage:default_image)
            
            cell.foodNameLbl.text = arr_Product_List[indexPath.item].productName
            cell.priceLbl.text = "\(rupees_symbol) \(arr_Product_List[indexPath.item].price) / \(arr_Product_List[indexPath.item].unitValue) \(arr_Product_List[indexPath.item].unit)"
            cell.rewardPointLbl.text = "Reward Point \(arr_Product_List[indexPath.item].rewards)"
            
            cell.btn_add.tag = indexPath.row
            cell.btn_minus.tag = indexPath.row
            cell.btn_plus.tag = indexPath.row
            
            cell.lbl_increament.text = arr_Product_List[indexPath.row].increament
            cell.btn_add.addTarget(self, action:#selector(btn_add(_:)), for: .touchUpInside)
            cell.btn_minus.addTarget(self, action:#selector(btn_minus(_:)), for: .touchUpInside)
            cell.btn_plus.addTarget(self, action:#selector(btn_plus(_:)), for: .touchUpInside)
            
            if arr_Product_List[indexPath.item].increament == "0" {
                cell.btn_add.isHidden = false
                cell.stack_add_minus.isHidden = true
            } else {
                cell.btn_add.isHidden = true
                cell.stack_add_minus.isHidden = false
            }
            
            return cell
        }
        
    }
    
    @IBAction func btn_add (_ sender:UIButton) {
        arr_Product_List[sender.tag].increament = "\(Int(arr_Product_List[sender.tag].increament)!+1)"
        mainCollView.reloadData()
        func_check_cart()
    }
    
    @IBAction func btn_minus (_ sender:UIButton) {
        arr_Product_List[sender.tag].increament = "\(Int(arr_Product_List[sender.tag].increament)!-1)"
        mainCollView.reloadData()
        func_check_cart()
    }
    
    @IBAction func btn_plus (_ sender:UIButton) {
        arr_Product_List[sender.tag].increament = "\(Int(arr_Product_List[sender.tag].increament)!+1)"
        mainCollView.reloadData()
        func_check_cart()
    }
    
    @objc func tabbButton(_ sender: UIButton){
        let indexx = IndexPath(item: sender.tag, section: 0)
        let cell = topTitleCollView.cellForItem(at: indexx) as! MainTopCollCell
        cell.selectedLineLbl.backgroundColor = UIColor(red: 255.0/255.0, green: 38.0/255.0, blue: 0.0/255.0, alpha: 1.0)
        selectedArr.add(indexx)
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.size.height
        let width = collectionView.frame.size.width
        
        if topTitleCollView == collectionView {
            return CGSize(width:100, height: height)
        } else {
            return CGSize(width: width/2-5, height: 240)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if topTitleCollView == collectionView {
            self.func_get_products(mealCategory[indexPath.row].id,"")
            
            for i in 0..<arr_select_header.count {
                if i == indexPath.row {
                    arr_select_header[i] = true
                } else {
                    arr_select_header[i] = false
                }
            }
            topTitleCollView.reloadData()
        } else {
            let food_details = storyboard?.instantiateViewController(withIdentifier: "Food_Details_ViewController") as! Food_Details_ViewController
            food_details.selected_index_path = indexPath.row
            
            self.navigationController?.pushViewController(food_details, animated: true)
        }
    }
    
}


