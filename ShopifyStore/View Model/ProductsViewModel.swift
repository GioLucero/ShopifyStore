//
//  ProductViewModel.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-21.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import Foundation
import SwiftUI

class ProductsViewModel: ObservableObject {
    // any changes in this file will update other views - SOURCE OF TRUTH
    static let shared = ProductsViewModel()
    
    @Published var productCards: [ProductCard] = [ProductCard]() // initialize product card array
    
    
    init() {
        self.getProductData { result in
            self.productCards = result
        }
    }
    
    // Not only gets the data from backend, but also parses it to what we want.
    public func getProductData(completion: @escaping ([ProductCard]) -> Void) {
        
        NetworkManager.shared.getCardData(withURL: NetworkManager.productURL) { productCardsJSON in
                
            print("making request")
            let productCards = productCardsJSON["products"].arrayValue.map {
                // $0 - accesses the key elemenent
                ProductCard(withJSON: $0)
            }
            completion(productCards)
        }
    }
    
    
}
