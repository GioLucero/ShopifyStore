//
//  Order.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-04-22.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

/// Model that handles all the data for the shopping cart view
class ShoppingCart: ObservableObject {
    @Published var items = [ProductCard]()
    
    /// Function to return the total checkout price
    func getTotalPrice() -> Double {
        var totalPrice: Double = 0.0

        for productCard in items {
            totalPrice += productCard.price
        }
        return totalPrice
    }
    
    /// Returns shipping price
    func getShippingPrice() -> Double {
        var shippingPrice: Double = 0.0
        let totalPrice = getTotalPrice()
        
        if (totalPrice > 0) {
            shippingPrice = 7.99
        } else {
            return shippingPrice
        }
        return shippingPrice
    }
    
    /// Returns total before tax
    func getSubtotal() -> Double {
        // subtotal = cost of products + shipping
        let totalPrice = getTotalPrice()
        let shippingPrice = getShippingPrice()
        var subtotal: Double = 0.0
        
        if (totalPrice > 0) {
            subtotal = totalPrice + shippingPrice
        } else {
            subtotal = 0.0
        }
        return subtotal
    }

    /// Return task of given items
    func getGST() -> Double {
        // GST = subtotal * .13
        var GST: Double = 0.0
        let totalPrice = getTotalPrice()
        
        if (totalPrice > 0) {
            GST = getSubtotal() * 0.13
        } else {
            return GST
        }
        return GST
    }

    /// Returns the total price of the order
    func getOrderTotal() -> Double {
        // total = subtotal + GST
        let orderTotal: Double = getSubtotal() + getGST()
        return orderTotal
    }
}
