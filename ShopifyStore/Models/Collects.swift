//
//  Collects.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-25.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import UIKit
import SwiftyJSON

/// Model for the collects objects
/// Used to group product id's to their corresponding collection
struct Collects {
    /// ID of the collects
    var id: Int
    /// ID of the collection
    var collectionID: Int
    /// ID of the product
    var productID: Int
    
    /// Initializing the collects information, and returning the model to house each element
    init(withID id: Int, andCollectionID collectionID: Int, andProductID productID: Int) {
        self.id = id
        self.collectionID = collectionID
        self.productID = productID
    }
    
    /// This initialization allows us to fetch the elements from our collects model from the collects JSON
    init(withJSON json: JSON) {
        self.init (
            /// Storing the value from the collects JSON into the elements of the collects model
            withID: json["id"].intValue,
            andCollectionID: json["collection_id"].intValue,
            andProductID: json["product_id"].intValue
        )
    }
}
