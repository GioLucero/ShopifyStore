//
//  CollectionViewModel.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-21.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import Foundation
import SwiftUI

// handles all the data for the collection views
class CollectionViewModel: ObservableObject {
    static let shared = CollectionViewModel()
    
    // any changes in this file will update other views - SOURCE OF TRUTH
    @Published var collectionCards: [CollectionCard] = [CollectionCard]()
    
    init() {
        self.getCustomCollectionData { result in
            self.collectionCards = result
        }
    }
    
    public func getCustomCollectionData(completion: @escaping ([CollectionCard]) -> Void) {
        
        NetworkManager.shared.getCardData(withURL: NetworkManager.customCollectURL) { customCollectionCardsJSON in
        
            let collectionCards = customCollectionCardsJSON["custom_collections"].arrayValue.map {
                
                CollectionCard(withJSON: $0)
            }
            completion(collectionCards)
        }
    }
}
