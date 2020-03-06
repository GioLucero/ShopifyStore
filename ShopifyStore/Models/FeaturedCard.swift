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
    var isLimitedTime: Bool
    var isSale: Bool
    
    var logo: String
    
    init(withTitle title: String, andIsLimitedTime isLimitedTime: Bool, andIsSale isSale: Bool, andLogo logo: String) {
        
        self.title = title
        self.isLimitedTime = isLimitedTime
        self.isSale = isSale
        self.logo = logo
    }
}
