//
//  CompleteOrderVC.swift
//  Meat Mania
//
//  Created by Uttam on 26/12/19.
//  Copyright © 2019 appentus. All rights reserved.
//

import UIKit
import XLPagerTabStrip
class CompleteOrderVC: UIViewController,IndicatorInfoProvider {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
        return IndicatorInfo(title: "Complete Order")
    }

}
