//
//  ProductViewModel.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-21.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import Alamofire

/// Handles all the data for product cards
/// Any changes in this file will update other views - SOURCE OF TRUTH
class ProductsViewModel: ObservableObject {
    /// Shared singleton of the global instance of CollectionViewModel
    static let shared = ProductsViewModel()
    
    let didChange = PassthroughSubject<ProductsViewModel, Never>()
    
    @Published var productCards: [ProductCard] = [ProductCard]() {
        didSet {
            didChange.send(self)
        }
    }
    
    /// This function give us the parsed JSON array
    public func getProductData(withProductIds productIds: [Int], completion: @escaping ([ProductCard]) -> Void) {
        
        let productIdsStringConversion: String = productIds.map { String($0) }.joined(separator: ",")
        /// Passing in parameters for getCardData function
        let parameter: Parameters = [
            "ids": productIdsStringConversion
        ]
        
        /// Passing in the products url for API call
        NetworkManager.shared.getCardData(withURL: NetworkManager.productURL, andParameters: parameter) { productCardsJSON in
            /// Iterating through 'products' array - accessing first key element
            let productCards = productCardsJSON["products"].arrayValue.map {
                /// $0 - accesses the key elemenent
                ProductCard(withJSON: $0)
            }
            completion(productCards)
        }
    }
    
    
}
