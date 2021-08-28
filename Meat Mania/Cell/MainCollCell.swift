//
//  MainCollView.swift
//  Meat Mania
//
//  Created by Uttam on 26/12/19.
//  Copyright © 2019 appentus. All rights reserved.
//

import UIKit

class MainCollCell: UICollectionViewCell {
    @IBOutlet weak var foodNameLbl: UILabel!
    @IBOutlet weak var foodNameImg: UIImageView!
    @IBOutlet weak var priceLbl: UILabel!
//    @IBOutlet weak var addBttn: UIButton!
    @IBOutlet weak var rewardPointLbl: UILabel!
    
    @IBOutlet weak var view_container: UIView!
    
    @IBOutlet weak var btn_add: UIButton!
    @IBOutlet weak var btn_minus: UIButton!
    @IBOutlet weak var btn_plus: UIButton!
    @IBOutlet weak var lbl_increament: UILabel!
    @IBOutlet weak var stack_add_minus: UIStackView!
    
    override func awakeFromNib() {
        view_container.layer.shadowColor = UIColor.lightGray.cgColor
        view_container.layer.shadowOpacity = 2
        view_container.layer.shadowOffset = CGSize(width: 0, height: 0)
        view_container.layer.shadowRadius = 2
    }
}
