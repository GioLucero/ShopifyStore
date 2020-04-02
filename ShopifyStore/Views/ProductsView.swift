//
//  ProductsView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-02-29.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI


struct ProductsView: View {
    @EnvironmentObject var productsCardViewModel: ProductsViewModel
    @EnvironmentObject var collectsViewModel: CollectsViewModel
    
     
    @State var filteredProducts: [ProductCard] = []
    
    // this will help identify the list of products we need for each custom collection
    // once custom collection is clicked, then the id will be passed into the productsView
    let customCollectionID: Int

    
    var body: some View {
        
        VStack {
            
            PreventCollapseView()
            
            VStack {
                HStack {
                    Text("Products")
                        .font(.system(size: 30, weight: .heavy, design: .default))
                        .lineLimit(nil)
                        .padding(.horizontal, 24)
                        .padding(.top, -10)
                    
                    Spacer()
                }
                
                ForEach(filteredProducts, id: \.self) { productCard in
                    ProductCardView(productCard: productCard)
                    
                }
                    
                .padding(.top, -10)
            }
        }.onAppear {
            self.filteredProducts = self.getFilteredProducts(withProductIds: self.getProductIds())
        }
    }

    
    // function to filter the product data corresponding to the correct collection
    public func getFilteredProducts(withProductIds productIds: [Int]) -> [ProductCard] {
       
        let products = productsCardViewModel.productCards
        var filterProducts: [ProductCard] = []
        
        for productId in productIds {
            for product in products {
                /// This line skips the products that do not match the ones that we want.
                if productId == product.id {
                    filterProducts.append(product)
                }
            }
        }
         return filterProducts
    }
    
    // return the productIds that match the collectionID in the collects JSON
    func getProductIds() -> [Int] {
        let collects = collectsViewModel.collectsData
        var productIds: [Int] = []
        
        // appending matching productIds to the empty array of productIds
        for collect in collects {
            if collect.collectionID == self.customCollectionID {
                productIds.append(collect.productID)
            }
        }
        return productIds
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

