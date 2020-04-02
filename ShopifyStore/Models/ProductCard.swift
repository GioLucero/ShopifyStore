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
    var description: String
    var price: Double
    var quantity: Int
    var image: UIImage
    var isFavourite: Bool
    
    init(withId id: Int, withtitle title: String, andDescription description: String, andVendorName vendor: String, andPrice price: Double, andQuantity quantity: Int, andImage image: UIImage, andIsFavourite isFavourite: Bool = false) {
        
        self.id = id
        self.title = title
        self.description = description
        self.vendorName = vendor
        self.price = price
        self.quantity = quantity
        self.image = image
        self.isFavourite = isFavourite
    }
    
    init(withJSON json: JSON) {
        self.init(
            withId: json["id"].intValue,
            withtitle: json["title"].stringValue,
            andDescription: json["body_html"].stringValue,
            andVendorName: json["vendor"].stringValue,
            andPrice: json["variants"][0]["price"].doubleValue,
            andQuantity: json["variants"][0]["inventory_quantity"].intValue,
            andImage: UIImage(fromUrl: json["image"]["src"].stringValue)
        )
    }
}
