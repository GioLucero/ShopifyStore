//
//  ParallaxView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-08.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

struct ParallaxView: View {
    
    @ObservedObject var productsViewModel = ProductsViewModel.shared
    @ObservedObject var collectsViewModel = CollectsViewModel.shared
    
    @State var isLoading = true
    
    let customCollectionID: Int
    
    var body: some View {
        ZStack {
            if isLoading {
                ActivityIndicator(isAnimating: $isLoading, style: .large)
            } else {
                getScrollView()
            }
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear {
            self.collectsViewModel.getCollectData(withCollectionId: self.customCollectionID) { productIds in
                self.productsViewModel.getProductData(withProductIds: productIds) { productCards in
                    self.productsViewModel.productCards = productCards
                    self.isLoading = false
                }
            }

        }
    }
    
    func getScrollView() -> some View {
        ScrollView {
                // Parallax Effect on featured card
                GeometryReader { geometry in
                    VStack {
                        if geometry.frame(in: .global).minY <= 0 {
                            Image("Featured-Card-Bg")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
                                .clipped()
                                .offset(y: -geometry.frame(in: .global).minY)
                        } else {
                            Image("Featured-Card-Bg")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
                                .clipped()
                                .offset(y: -geometry.frame(in: .global).minY)
                        }
                    }
                }
                .frame(height: 400)
                
                // Collection banner w/ name and subtitle
                VStack(alignment: .leading) {
                    Spacer()
                    HStack {
                        // Banner Images
                        Image("shopify-robot-testdata")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 60, height: 60)
                            .clipped()
                            .cornerRadius(10)
                            .padding(.horizontal, 15)
                        VStack(alignment: .leading) {
                            // Subtitle
                            Text("Featured")
                                .font(.custom("AvenirNext-Medium", size: 15))
                                .foregroundColor(.gray)
                            // Custom Collection Title
                            Text("Collection")
                                .font(.custom("AvenirNext-Demibold", size: 15))
                                .foregroundColor(.black)
                        }
                        Spacer()
                    }
                    // Border for product images
                    .background(LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: 183/255, green: 283/255, blue: 169/255, opacity: 0.85),.white]), startPoint: .trailing, endPoint: .leading))
                    .offset(x: 10, y: -8)
                    .padding(.horizontal, -10)
                    // Inserting ProductsView
                    ProductsView(productsCardViewModel: productsViewModel)
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
