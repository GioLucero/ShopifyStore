//
//  CollectionViewModel.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-21.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

/// Handles all the data for the collection views
/// Any changes in this file will update other views - SOURCE OF TRUTH
class CollectionViewModel: ObservableObject {
    /// Shared singleton of the global instance of CollectionViewModel
    static let shared = CollectionViewModel()
    
    let didChange = PassthroughSubject<CollectionViewModel, Never>()
    
    @Published var collectionCards: [CollectionCard] = [CollectionCard]() {
        didSet {
            didChange.send(self)
        }
    }
    
    /// This function gives us the parsed JSON array
    public func getCustomCollectionData(completion: @escaping ([CollectionCard]) -> Void) {
        
        /// Passing in the custom collection url for API call 
        NetworkManager.shared.getCardData(withURL: NetworkManager.customCollectURL) { customCollectionCardsJSON in
            
            /// Map function returns the JSON array for the custom collection cards
            let collectionCards = customCollectionCardsJSON["custom_collections"].arrayValue.map {
                /// $0 - accesses the key elemenent
                CollectionCard(withJSON: $0)
            }
            completion(collectionCards)
        }
    }
}
