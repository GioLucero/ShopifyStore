//
//  ProductVariants.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-28.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import UIKit

extension Variant {
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


