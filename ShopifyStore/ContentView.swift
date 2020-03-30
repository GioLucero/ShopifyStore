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
                ForEach(collectionCardViewModel.collectionCards, id: \.self) { productCard in
                    VStack {
                        NavigationLink(destination: ParallaxView(collectionCard: collections)) {
                            CollectionCardView(customCollectionCard: productCard)
                        }
                    .buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .navigationBarTitle("Collections")
        }
    }
}


//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        ContentView(collectionCards:
//
//            [
//                CollectionCard(withId: 20, withImage: UIImage(), andBackgroundImage: "", andTitle: "", andSubtitle: "Best-selling", andDescription: "", andIsOnSale: false)
//        ])
//    }
//}
//
//
//var products =
//
//    [
//        ProductCard(withId: 1, withtitle: "Clock", andVendorName: "Jenkins", andPrice: 29.99, andQuantity: 40, andImage: "shopify-robot-testdata", andIsFavourite: false),
//        ProductCard(withId: 1, withtitle: "Clock", andVendorName: "Jenkins", andPrice: 29.99, andQuantity: 40, andImage: "shopify-robot-testdata", andIsFavourite: false),
//        ProductCard(withId: 1, withtitle: "Clock", andVendorName: "Jenkins", andPrice: 29.99, andQuantity: 40, andImage: "shopify-robot-testdata", andIsFavourite: false),
//        ProductCard(withId: 1, withtitle: "Clock", andVendorName: "Jenkins", andPrice: 29.99, andQuantity: 40, andImage: "shopify-robot-testdata", andIsFavourite: false),
//        ProductCard(withId: 1, withtitle: "Clock", andVendorName: "Jenkins", andPrice: 29.99, andQuantity: 40, andImage: "shopify-robot-testdata", andIsFavourite: false),
//        ProductCard(withId: 1, withtitle: "Clock", andVendorName: "Jenkins", andPrice: 29.99, andQuantity: 40, andImage: "shopify-robot-testdata", andIsFavourite: false),
//        ProductCard(withId: 1, withtitle: "Clock", andVendorName: "Jenkins", andPrice: 29.99, andQuantity: 40, andImage: "shopify-robot-testdata", andIsFavourite: false)
//
//]
//

// Passing information to parallaxView banner 
var collections = CollectionCard(withId: 1, withImage: UIImage(), andBackgroundImage: "", andTitle: "Awesome Collection", andSubtitle: "", andDescription: "", andIsOnSale: false)
