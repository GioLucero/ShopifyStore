//
//  CollectionCard.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-19.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import UIKit
import SwiftyJSON

import SwiftUI


/// Model for a single collecion card.
struct CollectionCard: Identifiable, Hashable {
    /// ID to identify collection
    var id: Int
    /// Image to be downloaded
    var image: UIImage
    /// background image taken from assets
    var backgroundImage: String
    /// title of the collection
    var title: String
    /// subtitle within the collection card
    var subtitle: String
    var description: String
    
    /// initializing the collection information, and returning the model to house each element
    init(withId id: Int, withImage image: String, andBackgroundImage backgroundImage: String, andTitle title: String, andSubtitle subtitle: String, andDescription description: String) {
        
        self.id = id
        self.image = UIImage(fromUrl: image)
        self.backgroundImage = backgroundImage
        self.title = title
        self.subtitle = subtitle
        self.description = description
    }
    
    /// This initialization allows us to fetch the elements from our Collection model from the custom collections JSON
    init(withJSON json: JSON) {
        self.init(
            /// Storing the value from the custom collection JSON into the elements of the collection model
            withId: json["id"].intValue,
            withImage: json["image"]["src"].stringValue,
            andBackgroundImage: "background1",
            andTitle: json["title"].stringValue,
            andSubtitle: json["sort_order"].stringValue,
            andDescription: json["body_html"].stringValue
        )
    }
}
