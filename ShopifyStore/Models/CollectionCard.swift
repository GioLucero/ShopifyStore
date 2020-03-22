//
//  CollectionCard.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-19.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import UIKit
import SwiftyJSON


// Blueprint for a single product card.
struct CollectionCard: Identifiable, Hashable {
    
    var id: Int
    
    var image: String
    var backgroundImage: String
    var title: String
    var subtitle: String
    var description: String
    var isOnSale: Bool
   
    
    init(withId id: Int, withImage image: String, andBackgroundImage backgroundImage: String, andTitle title: String, andSubtitle subtitle: String, andDescription description: String, andIsOnSale isOnSale: Bool = false) {
        
        self.id = id
        self.image = image
        self.backgroundImage = backgroundImage
        self.title = title
        self.subtitle = subtitle
        self.description = description
        self.isOnSale = isOnSale
    }
    
    init(withJSON json: JSON) {
        self.init(
            withId: json["id"].intValue,
            withImage: json["image"]["src"].stringValue,
            andBackgroundImage: "Featured-Card-Bg",
            andTitle: json["title"].stringValue,
            andSubtitle: json["sort_order"].stringValue,
            andDescription: json["body_html"].stringValue
        )
    }
}
