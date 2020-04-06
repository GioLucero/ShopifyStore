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

class CollectsViewModel: ObservableObject {
    static let shared = CollectsViewModel()
    
    let didChange = PassthroughSubject<CollectsViewModel, Never>()
    
    @Published var collectsData: [Collects] = [Collects]() {
        didSet {
            didChange.send(self)
        }
    }
    
    
    public func getCollectData(withCollectionId collectionId: Int, completion: @escaping ([Int]) -> Void) {
        
        let parameter: Parameters = [
            "collection_id": collectionId
        ]
        
        NetworkManager.shared.getCardData(withURL: NetworkManager.collectionURL, andParameters: parameter) { collectsDataJSON in
            
            let productIds: [Int] = collectsDataJSON["collects"].arrayValue.map {
                // first key in the array of JSON
                $0["product_id"].intValue
            }
            completion(productIds)
        }
    }
}
