//
//  CollectsViewModel.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-25.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import Foundation
import SwiftUI

class CollectsViewModel: ObservableObject {
    static let shared = CollectsViewModel()
    
    @Published var collectsData: [Collects] = [Collects]()
    
    init() {
        self.getCollectionData { result in
            self.collectsData = result
        }
    }
    
    public func getCollectionData(completion: @escaping ([Collects]) -> Void) {
        
        NetworkManager.shared.getCardData(withURL: NetworkManager.collectionURL) { collectsDataJSON in
            
            let collectsData = collectsDataJSON["collects"].arrayValue.map {
                // first key in the array of JSON
                Collects(withJSON: $0)
            }
            completion(collectsData)
        }
    }
}
