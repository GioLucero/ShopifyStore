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
    var title: String
    var subtitle: String
    
    init(withId id: Int, withImage image: String, andTitle title: String, andSubtitle subtitle: String) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
        self.id = id
    }
}
