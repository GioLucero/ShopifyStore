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
    
    init(withId id: Int, withtitle title: String, andVendorName vendor: String, andPrice price: Double, andQuantity quantity: Int, andImage image: String, andIsFavourite isFavourite: Bool = false) {
        
        self.id = id
        self.title = title
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
            andVendorName: json["vendor"].stringValue,
            andPrice: json["price"].doubleValue,
            andQuantity: json["inventory_quantity"].intValue,
            andImage: json["image"]["src"].stringValue
        )
    }
}

extension ProductCard {
    
    class Variant {
        var price: Double
        var quantity: Int
        var productImage: UIImage
        
        
        init(withPrice price: Double, andQuantity quantity: Int, andProductImage productImage: UIImage) {
            self.price = price
            self.quantity = quantity
            self.productImage = productImage
        }
        
        convenience init(fromJSON json: JSON) {
            self.init(
                withPrice: json["price"].doubleValue,
                andQuantity: json["inventory_quantity"].intValue,
                andProductImage: UIImage(
                    imageLiteralResourceName: json["image"]["src"].stringValue)
            )
        }
    }
}
