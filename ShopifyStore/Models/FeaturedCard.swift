//
//  FeaturedCard.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-01.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import UIKit

struct FeaturedCard {
    
    var title: String
    var description: String
    var footer: String
    var image: String
    var sale: Bool
    
    init(withTitle title: String, andDescription description: String, andFooter footer: String, andImage image: String, andSale sale: Bool) {
        self.title = title
        self.description = description
        self.footer = footer
        self.image = image
        self.sale = sale
    }
    

    
}
