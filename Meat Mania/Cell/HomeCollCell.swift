//
//  HomeCollCell.swift
//  Meat Mania
//
//  Created by iOS-Appentus on 25/December/2019.
//  Copyright © 2019 appentus. All rights reserved.
//

import UIKit

class HomeCollCell: UICollectionViewCell {
    @IBOutlet weak var immgg: UIImageView!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var view_container:UIView!
    
    override func awakeFromNib() {
        view_container.layer.shadowColor = UIColor.red.cgColor
        view_container.layer.shadowOpacity = 5
        view_container.layer.shadowOffset = CGSize(width: 0, height: 0)
        view_container.layer.shadowRadius = 5
    }
        
}



