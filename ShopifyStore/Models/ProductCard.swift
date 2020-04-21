//
//  ProductCard.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-01.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import UIKit
import SwiftyJSON

/// Model of a single product within each collection card
/// Using the products API
struct ProductCard: Hashable, Identifiable {
    /// ID to identify product within collects API
    var id: Int
    /// Name of the product
    var title: String
    /// Name of vendor of the product
    var vendorName: String
    var description: String
    /// Price of the product
    var price: Double
    /// Displays how many products are in stock
    var quantity: Int
    /// Image of the product to be downloaded
    var image: UIImage
    var isFavourite: Bool
    
    /// Initializing product information, and returns model to house each element
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
    
    /// This initialization allows us to fetch the elements from our Product model from the products url JSON
    init(withJSON json: JSON) {
        self.init(
            /// Storing the value from the products JSON into the elements of the product model
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
