//
//  ContentView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-02-29.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var collectionCardViewModel: CollectionViewModel
    @EnvironmentObject var productCardViewModel: ProductsViewModel
    
    var networkManager = NetworkManager()
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                SearchBarView()
                // insert featured banner here
                ForEach(collectionCardViewModel.collectionCards, id: \.self) { collectionCard in
                    VStack {
                        NavigationLink(destination: ParallaxView(customCollectionID: collectionCard.id)) {
                            CollectionCardView(customCollectionCard: collectionCard)
                        }
                    .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .navigationBarTitle("Collections")
        }
    }
}


// Passing information to parallaxView banner 
//var collections = ProductCard(withId: 12, withtitle: "Featured Product", andDescription: "", andVendorName: "", andPrice: 1, andQuantity: 1, andImage: UIImage())
