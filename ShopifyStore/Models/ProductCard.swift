//
//  ProductCard.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-01.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import UIKit
import SwiftyJSON

struct ProductCard: Hashable, Identifiable {
    var id: Int
    
    var title: String
    var vendorName: String
    var price: Double
    var quantity: Int
    var image: String
    var isFavourite: Bool
    
    init(withId id: Int, withtitle title: String, andVendorName vendor: String, andPrice price: Double, andQuantity quantity: Int, andImage image: String, andIsFavourite isFavourite: Bool) {
        
        self.id = id
        self.title = title
        self.vendorName = vendor
        self.price = price
        self.quantity = quantity
        self.image = image
        self.isFavourite = isFavourite
    }
    
//    init(fromJSON json: JSON) {
//        self.init(
//            id: json["id"].intValue,
//            title: json["title"].stringValue,
//            vendorName: json["vendor"].stringValue,
//            price: json["price"].doubleValue,
//            quantity: json["inventory_quantity"].intValue,
//            image: UIImage(
//                contentsOfFile: json["image"]["src"].stringValue
//            )
//        )
//    }
}

