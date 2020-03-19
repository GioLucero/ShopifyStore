//
//  ContentView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-02-29.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var collectionCards: [CollectionCard]
    @State var searchBar: SearchBarView
    
    var networkManager = NetworkManager()
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                SearchBarView()
                // insert featured banner here
                ForEach(collectionCards, id: \.self) { productCard in
                    VStack {
                        NavigationLink(destination: ParallaxView(productCards: products, collectionCard: collections)) {
                            CollectionCardView(productCard: productCard)
                        }
                    .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .navigationBarTitle("Collections")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView(collectionCards:
            
            [
                CollectionCard(withId: 20, withImage: "shopify-robot-testdata", andBackgroundImage: "", andTitle: "Awesome Collection", andSubtitle: "Best-selling", andDescription: "", andIsOnSale: false),
                
                CollectionCard(withId: 15, withImage: "shopify-robot-testdata", andBackgroundImage: "shopify-space", andTitle: "Title", andSubtitle: "Subtitle", andDescription: "", andIsOnSale: false),
        ], searchBar: SearchBarView())
    }
}


var products =
    
    [
        ProductCard(withId: 1, withtitle: "Clock", andVendorName: "Jenkins", andPrice: 29.99, andQuantity: 40, andImage: "shopify-robot-testdata", andIsFavourite: false),
        ProductCard(withId: 1, withtitle: "Clock", andVendorName: "Jenkins", andPrice: 29.99, andQuantity: 40, andImage: "shopify-robot-testdata", andIsFavourite: false),
        ProductCard(withId: 1, withtitle: "Clock", andVendorName: "Jenkins", andPrice: 29.99, andQuantity: 40, andImage: "shopify-robot-testdata", andIsFavourite: false),
        ProductCard(withId: 1, withtitle: "Clock", andVendorName: "Jenkins", andPrice: 29.99, andQuantity: 40, andImage: "shopify-robot-testdata", andIsFavourite: false),
        ProductCard(withId: 1, withtitle: "Clock", andVendorName: "Jenkins", andPrice: 29.99, andQuantity: 40, andImage: "shopify-robot-testdata", andIsFavourite: false),
        ProductCard(withId: 1, withtitle: "Clock", andVendorName: "Jenkins", andPrice: 29.99, andQuantity: 40, andImage: "shopify-robot-testdata", andIsFavourite: false),
        ProductCard(withId: 1, withtitle: "Clock", andVendorName: "Jenkins", andPrice: 29.99, andQuantity: 40, andImage: "shopify-robot-testdata", andIsFavourite: false)
        
]

var collections = CollectionCard(withId: 1, withImage: "shopify-robot-testdata", andBackgroundImage: "", andTitle: "Awesome Collection", andSubtitle: "", andDescription: "", andIsOnSale: false)
