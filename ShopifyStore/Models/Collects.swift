//
//  Collects.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-25.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import UIKit
import SwiftyJSON

struct Collects {
    var id: Int
    var collectionID: Int
    var productID: Int
    
    var featured: Bool
    
    init(withID id: Int, andCollectionID collectionID: Int, andProductID productID: Int, andFeatured featured: Bool) {
        self.id = id
        self.collectionID = collectionID
        self.productID = productID
        self.featured = featured
    }
    
    init(withJSON json: JSON) {
        self.init (
            withID: json["id"].intValue,
            andCollectionID: json["collection_id"].intValue,
            andProductID: json["product_id"].intValue,
            andFeatured: json["featured"].boolValue
        )
    }
}
