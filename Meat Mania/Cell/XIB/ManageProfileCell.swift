//
//  ManageProfileCell.swift
//  Meat Mania
//
//  Created by Uttam on 27/12/19.
//  Copyright © 2019 appentus. All rights reserved.
//

import UIKit

class ManageProfileCell: UITableViewCell {

    @IBOutlet weak var imgg: UIImageView!
    @IBOutlet weak var titleNameLbl: UILabel!
    @IBOutlet weak var mobileNumberText: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
