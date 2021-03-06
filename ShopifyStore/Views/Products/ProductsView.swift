//
//  ProductsView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-02-29.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

/// List of products to store inside for each collection
struct ProductsView: View {
    /// Model that holds the products data
    @ObservedObject var productsCardViewModel: ProductsViewModel
 
    var body: some View {
        
        VStack {
            
            PreventCollapseView()
            
            VStack {
                HStack {
                    /// Name of the list
                    Text("Products")
                        .font(.system(size: 30, weight: .heavy, design: .default))
                        .lineLimit(nil)
                        .padding(.horizontal, 24)
                        .padding(.top, -10)
                    
                    Spacer()
                }
                /// Creating a list of product cards
                ForEach(productsCardViewModel.productCards, id: \.self) { productCard in
                    ProductCardView(productCard: productCard)
                }
                .padding(.top, -10)
            }
        }
    }
}

struct PreventCollapseView: View {
    
    private var mostlyClear = Color(UIColor(white: 0.0, alpha: 0.0005))
    
    var body: some View {
        Rectangle()
            .fill(mostlyClear)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 1)
    }
}

