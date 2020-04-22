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
    /// Model that stores the data from the customCollection API
    @ObservedObject var collectionCardViewModel = CollectionViewModel.shared
    /// Displays a loading screen as the default
    @State var isLoading = true

    var body: some View {
        ZStack {
            /// Attempts loading screen
            if isLoading {
                ActivityIndicator(isAnimating: $isLoading, style: .large)
            } else {
                NavigationView {
                    ScrollView {
                        // insert featured banner here
                        /// Creating a list of collection cards
                        ForEach(collectionCardViewModel.collectionCards, id: \.self) { collectionCard in
                            VStack {
                                /// Once the collection clicked, it will direct the user to the next page
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
        /// Display data when loading is successful
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



