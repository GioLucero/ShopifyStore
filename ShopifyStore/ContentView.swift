//
//  ContentView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-02-29.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {

    @ObservedObject var collectionCardViewModel = CollectionViewModel.shared

    @State var isLoading = true

    var body: some View {
        ZStack {
            if isLoading {
                ActivityIndicator(isAnimating: $isLoading, style: .large)
            } else {
                NavigationView {
                    ScrollView {
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
        .onAppear {
            if self.isLoading {
                self.collectionCardViewModel.getCustomCollectionData { collectionCards in
                    self.collectionCardViewModel.collectionCards = collectionCards
                    self.isLoading = false
                }
            }
        }
    }
}


// Passing information to parallaxView banner
//var collections = ProductCard(withId: 12, withtitle: "Featured Product", andDescription: "", andVendorName: "", andPrice: 1, andQuantity: 1, andImage: UIImage())



