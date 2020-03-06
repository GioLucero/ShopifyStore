//
//  ProductsView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-02-29.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

struct ProductsView: View {
    @State var productCards: [ProductCard]
    
    var body: some View {
        
        NavigationView {
            List {
                VStack(spacing: -20) {
                    ForEach(productCards, id: \.self) { productCard in
                        ProductCardView(productCard: productCard)
                    }
                }
            }
        }
         .navigationBarTitle("Products")
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView(productCards:
            
            [
                ProductCard(withId: 15, withtitle: "Banchode", andVendorName: "Curry Banca", andPrice: 34.50, andQuantity: 20, andImage: "shopify-robot-testdata", andIsFavourite: true),
        
                ProductCard(withId: 20, withtitle: "Banchode", andVendorName: "Curry Banca", andPrice: 34.50, andQuantity: 20, andImage: "shopify-robot-testdata", andIsFavourite: true),
                ProductCard(withId: 20, withtitle: "Banchode", andVendorName: "Curry Banca", andPrice: 34.50, andQuantity: 20, andImage: "shopify-robot-testdata", andIsFavourite: true),
                ProductCard(withId: 20, withtitle: "Banchode", andVendorName: "Curry Banca", andPrice: 34.50, andQuantity: 20, andImage: "shopify-robot-testdata", andIsFavourite: true),
                ProductCard(withId: 20, withtitle: "Banchode", andVendorName: "Curry Banca", andPrice: 34.50, andQuantity: 20, andImage: "shopify-robot-testdata", andIsFavourite: true),
                ProductCard(withId: 20, withtitle: "Banchode", andVendorName: "Curry Banca", andPrice: 34.50, andQuantity: 20, andImage: "shopify-robot-testdata", andIsFavourite: true)
            ])
    }
}
