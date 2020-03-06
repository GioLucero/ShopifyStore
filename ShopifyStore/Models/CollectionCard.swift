//
//  File.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-02-29.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import UIKit

// Blueprint for a single product card.
struct CollectionCard: Identifiable, Hashable {
    
    var id: Int
    
    var image: String
    var backgroundImage: String
    var title: String
    var subtitle: String
    var description: String
    var isOnSale: Bool
   
    
    init(withId id: Int, withImage image: String, andBackgroundImage backgroundImage: String, andTitle title: String, andSubtitle subtitle: String, andDescription description: String, andIsOnSale isOnSale: Bool) {
        
        self.id = id
        self.image = image
        self.backgroundImage = backgroundImage
        self.title = title
        self.subtitle = subtitle
        self.description = description
        self.isOnSale = isOnSale
    }
}
