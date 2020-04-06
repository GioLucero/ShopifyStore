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

class ProductsViewModel: ObservableObject {
    // any changes in this file will update other views - SOURCE OF TRUTH
    static let shared = ProductsViewModel()
    
    let didChange = PassthroughSubject<ProductsViewModel, Never>()
    
    @Published var productCards: [ProductCard] = [ProductCard]() {
        didSet {
            didChange.send(self)
        }
    }
    
    // Not only gets the data from backend, but also parses it to what we want.
    public func getProductData(withProductIds productIds: [Int], completion: @escaping ([ProductCard]) -> Void) {
        
        
        let productIdsStringConversion: String = productIds.map { String($0) }.joined(separator: ",")
        
        let parameter: Parameters = [
            "ids": productIdsStringConversion
        ]
        
        NetworkManager.shared.getCardData(withURL: NetworkManager.productURL, andParameters: parameter) { productCardsJSON in
                
            let productCards = productCardsJSON["products"].arrayValue.map {
                // $0 - accesses the key elemenent
                ProductCard(withJSON: $0)
            }
            completion(productCards)
        }
    }
    
    
}
