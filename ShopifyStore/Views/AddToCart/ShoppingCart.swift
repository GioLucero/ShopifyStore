//
//  Order.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-04-22.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

class ShoppingCart: ObservableObject {
    @Published var items = [ProductCard]()
    
    func getTotalPrice() -> Double {
        var totalPrice: Double = 0.0
        // iterate through items array
        // add the new item price to existing item price
        // return the price
        for productCard in items {
            totalPrice += productCard.price
        }
        return totalPrice
    }
}
