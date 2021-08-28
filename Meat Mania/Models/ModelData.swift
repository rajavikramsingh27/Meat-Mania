//
//  ModelData.swift
//  Meat Mania
//
//  Created by Uttam on 03/01/20.
//  Copyright © 2020 appentus. All rights reserved.
//

import Foundation


struct Category: Codable {
    let id, title, slug, parent: String
    let leval, datumDescription, image, icon: String
    let status, featured, ordering, count: String
    let pCount: String
    
    enum CodingKeys: String, CodingKey {
        case id, title, slug, parent, leval
        case datumDescription = "description"
        case image, icon, status, featured, ordering
        case count = "Count"
        case pCount = "PCount"
    }
}



// MARK: - Welcome
//struct Welcome: Codable {
//    let responce: Bool
//    let data: [Datum]
//}

// MARK: - Datum
struct Product_List: Codable {
    let productID, productName, categoryID, productDescription: String
    let dealPrice, startDate, startTime, endDate: String
    let endTime, price, mrp, productImage: String
    let status, inStock, unitValue, unit: String
    var increament, rewards, stock, title: String
    
    enum CodingKeys: String, CodingKey {
        case productID = "product_id"
        case productName = "product_name"
        case categoryID = "category_id"
        case productDescription = "product_description"
        case dealPrice = "deal_price"
        case startDate = "start_date"
        case startTime = "start_time"
        case endDate = "end_date"
        case endTime = "end_time"
        case price, mrp
        case productImage = "product_image"
        case status
        case inStock = "in_stock"
        case unitValue = "unit_value"
        case unit, increament, rewards, stock, title
    }
}
