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
/// Used to match product id's to their corresponding collection
struct Collects {
    /// ID of the collects
    var id: Int
    /// ID of the collection
    var collectionID: Int
    /// ID of the product
    var productID: Int
    var featured: Bool
    
    /// Initializing the collects information, and returning the model to house each element
    init(withID id: Int, andCollectionID collectionID: Int, andProductID productID: Int, andFeatured featured: Bool) {
        self.id = id
        self.collectionID = collectionID
        self.productID = productID
        self.featured = featured
    }
    
    /// This initialization allows us to fetch the elements from our collects model from the collects JSON
    init(withJSON json: JSON) {
        self.init (
            /// Storing the value from the collects JSON into the elements of the collects model
            withID: json["id"].intValue,
            andCollectionID: json["collection_id"].intValue,
            andProductID: json["product_id"].intValue,
            andFeatured: json["featured"].boolValue
        )
    }
}
