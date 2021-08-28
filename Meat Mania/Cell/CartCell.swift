//
//  CartCell.swift
//  Meat Mania
//
//  Created by Uttam on 27/12/19.
//  Copyright © 2019 appentus. All rights reserved.
//

import UIKit

class CartCell: UITableViewCell {
    @IBOutlet weak var cancelBttn: UIButton!
//    @IBOutlet weak var addBttn: UIButton!
//    @IBOutlet weak var countLbl: UILabel!
//    @IBOutlet weak var substractBttn: UIButton!
    @IBOutlet weak var productCalculationLbl: UILabel!
    @IBOutlet weak var rewardPointLbl: UILabel!
    @IBOutlet weak var productPriceLbl: UILabel!
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productNameLbl: UILabel!
    
    @IBOutlet weak var btn_add: UIButton!
    @IBOutlet weak var btn_minus: UIButton!
    @IBOutlet weak var btn_plus: UIButton!
    @IBOutlet weak var lbl_increament: UILabel!
    @IBOutlet weak var stack_add_minus: UIStackView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
