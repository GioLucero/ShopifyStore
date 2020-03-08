//
//  ProductsAndFeaturedCardView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-08.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

struct ProductsAndFeaturedCardView: View {
    @State var featuredCard: CollectionCard
    @State var productCards: [ProductCard]
    
    var body: some View {
        
        VStack {
            CollectionFeaturedCard(collectionCard: $featuredCard)
            ProductsView(productCards: $productCards)
            
        }
    }
}

struct ProductsAndFeaturedCardView_Previews: PreviewProvider {
    static var previews: some View {
        
        ProductsAndFeaturedCardView(featuredCard: featuredCard, productCards: productCards)
        
    }
}



var featuredCard: CollectionCard =
        
    CollectionCard(withId: 5, withImage: "shopify-robot-testdata", andBackgroundImage: "space-shopify", andTitle: "Awesome Collection", andSubtitle: "Top Rated Collection", andDescription: "The top of the line of aerodynamic products all in the same collection.", andIsOnSale: true)
    


var productCards: [ProductCard] =
    
    [
        ProductCard(withId: 15, withtitle: "Awesome", andVendorName: "Curry Banca", andPrice: 34.50, andQuantity: 20, andImage: "shopify-robot-testdata", andIsFavourite: true),
        
        ProductCard(withId: 20, withtitle: "Radical", andVendorName: "Curry Banca", andPrice: 34.50, andQuantity: 20, andImage: "shopify-robot-testdata", andIsFavourite: true),
        ProductCard(withId: 20, withtitle: "Keyboard", andVendorName: "Curry Banca", andPrice: 34.50, andQuantity: 20, andImage: "shopify-robot-testdata", andIsFavourite: true),
        ProductCard(withId: 20, withtitle: "Clock", andVendorName: "Curry Banca", andPrice: 34.50, andQuantity: 20, andImage: "shopify-robot-testdata", andIsFavourite: true),
        ProductCard(withId: 20, withtitle: "Fender", andVendorName: "Curry Banca", andPrice: 34.50, andQuantity: 20, andImage: "shopify-robot-testdata", andIsFavourite: true),
        ProductCard(withId: 20, withtitle: "Banchode", andVendorName: "Curry Banca", andPrice: 34.50, andQuantity: 20, andImage: "shopify-robot-testdata", andIsFavourite: true)
]
