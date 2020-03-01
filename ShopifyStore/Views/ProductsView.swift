//
//  ProductsView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-02-29.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

struct ProductsView: View {
    @State var productCard: ProductCard
    
    var body: some View {
       Text("Hello World")
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsView(productCard: ProductCard(withtitle: "Banchode", andVendorName: "Curry Banca", andPrice: 34.50, andQuantity: 20, andImage: "shopify-robot-testdata", andIsFavourite: true))
    }
}
