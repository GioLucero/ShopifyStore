//
//  ParallaxView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-08.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI
import UIKit


/// Displays the products that are stored in each collection
struct ParallaxView: View {
    /// Models that hold the products and collects data
    @ObservedObject var productsViewModel = ProductsViewModel.shared
    @ObservedObject var collectsViewModel = CollectsViewModel.shared
    /// Display a loading screen as default
    @State var isLoading = true
    
    let description: String
    let parallaxImageName: UIImage
    let customCollectionID: Int
    
    var body: some View {
        /// Attempts loading screen
        ZStack {
            if isLoading {
                ActivityIndicator(isAnimating: $isLoading, style: .large)
            } else {
                ScrollView {
                    /// Parallax Effect on featured card
                    GeometryReader { geometry in
                        VStack {
                            /// Stretches image based on the position of the scroll
                            if geometry.frame(in: .global).minY <= 0 {
                                Image(uiImage: self.parallaxImageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 300, height: 300)
                                    .offset(x: 30, y: 50)
                                    .background(Image("Featured-Card-Bg"))
                                    .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
                                    .clipped()
                                    .offset(y: -geometry.frame(in: .global).minY)
                            } else {
                                Image(uiImage: self.parallaxImageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 300, height: 300)
                                    .offset(x: 30, y: 50)
                                    .background(Image("Featured-Card-Bg"))
                                    .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
                                    .clipped()
                                    .offset(y: -geometry.frame(in: .global).minY)
                            }
                        }
                    }
                    .frame(height: 400)
                    
                    /// Displays banner that stores description of the collection
                    VStack(alignment: .leading) {
                        Spacer()
                        HStack {
                            /// Banner Images
                            Image(uiImage: self.parallaxImageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 60, height: 60)
                                .clipped()
                                .cornerRadius(10)
                                .padding(.horizontal, 15)
                            VStack(alignment: .leading) {
                                /// Subtitle
                                Text("Featured")
                                    .font(.custom("AvenirNext-Medium", size: 15))
                                    .foregroundColor(.gray)
                                /// Description
                                Text(self.description)
                                    .font(.custom("AvenirNext-Medium", size: 12))
                                    .foregroundColor(.black)
                            }
                            .padding(.vertical, 5)
                            Spacer()
                        }
                            /// Border for product images
                            .background(LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: 183/255, green: 283/255, blue: 169/255, opacity: 0.85),.white]), startPoint: .trailing, endPoint: .leading))
                            .offset(x: 10, y: -8)
                            .padding(.horizontal, -10)
                        /// Display a list of products of the collection
                        ProductsView(productsCardViewModel: productsViewModel)
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
            /// Display data of this view when loading is successful
            .onAppear {
                self.collectsViewModel.getCollectData(withCollectionId: self.customCollectionID) { productIds in
                    self.productsViewModel.getProductData(withProductIds: productIds) { productCards in
                        self.productsViewModel.productCards = productCards
                        self.isLoading = false
                    }
                }
        }
    }
}

//struct ParallaxView_Previews: PreviewProvider {
//    static var previews: some View {
//        ParallaxView(productCard: ProductCard(withId: 1, withtitle: "Featured Product", andDescription: "", andVendorName: "", andPrice: 12, andQuantity: 1, andImage: UIImage()), customCollectionID: 1)
//
//    }
//}
