//
//  CollectsViewModel.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-25.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import Foundation
import SwiftUI
import Combine
import Alamofire

/// Used to group products to the corresponding collection
class CollectsViewModel: ObservableObject {
    /// Shared singleton of the global instance of CollectionViewModel
    static let shared = CollectsViewModel()
    /// Updates views once data has been changed
    let didChange = PassthroughSubject<CollectsViewModel, Never>()
    /// Array of collects that we can bind the values of our collectsViewModel
    @Published var collectsData: [Collects] = [Collects]() {
        didSet {
            didChange.send(self)
        }
    }
    
    /// fetching the collect data 
    public func getCollectData(withCollectionId collectionId: Int, completion: @escaping ([Int]) -> Void) {
        /// Passing in parameters for getCardData funcrtion 
        let parameter: Parameters = [
            "collection_id": collectionId
        ]
        
        /// Passing in the collection url for API call
        NetworkManager.shared.getCardData(withURL: NetworkManager.collectionURL, andParameters: parameter) { collectsDataJSON in
            /// Going through the JSON and accessing the first key element
            let productIds: [Int] = collectsDataJSON["collects"].arrayValue.map {
                /// $0 - accesses the key elemenent
                $0["product_id"].intValue
            }
            completion(productIds)
        }
    }
}
