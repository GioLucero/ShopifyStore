//
//  ProductView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-02-29.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

struct ProductCardView: View {
    @State var productCard: ProductCard
    
    var body: some View {
        HStack() {
            Image(productCard.image)
                .resizable()
                .frame(width: 125, height: 125)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(productCard.title)
                    .font(.title)
                    .foregroundColor(.primary)
                
                Text("By: \(productCard.vendorName)")
                    .font(.headline)
                    .foregroundColor(.secondary)
                
                Text("CDN " + String(format: "%.2f", productCard.price))
                    .font(.title)
                
                Text("In stock: \(productCard.quantity)")
                    .font(.subheadline)
                    .foregroundColor(.green)
            }
            Spacer()
            
            if productCard.isFavourite {
                Image(systemName: productCard.isFavourite ? "heart.fill" : "heart")
                    .font(.title)
                    .padding()
                    .foregroundColor(.blue)
            } else {
                Image(systemName: "heart")
                    .font(.title)
                    .padding()
                    .foregroundColor(.blue)
            }
    }
//    .overlay(
//    RoundedRectangle(cornerRadius: 20)
//    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), lineWidth: 1))
//    .padding()
}
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCardView(productCard: ProductCard(withId: 10, withtitle: "Banchode", andVendorName: "Curry Banca", andPrice: 34.5, andQuantity: 20, andImage: "shopify-robot-testdata", andIsFavourite: true))
    }
}
