//
//  MenuTblCell.swift
//  Meat Mania
//
//  Created by Uttam on 26/12/19.
//  Copyright © 2019 appentus. All rights reserved.
//

import UIKit

class MenuTblCell: UITableViewCell {

    @IBOutlet weak var menuImg: UIImageView!
    @IBOutlet weak var menuNameLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
