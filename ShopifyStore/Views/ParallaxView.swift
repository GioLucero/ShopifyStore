//
//  ParallaxView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-08.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

struct ParallaxView: View {
 
    
    @State var collectionCard: CollectionCard
    
    
    var body: some View {
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
                    Image(collectionCard.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipped()
                        .cornerRadius(10)
                    VStack(alignment: .leading) {
                        Text("Featured")
                            .font(.custom("AvenirNext-Medium", size: 15))
                            .foregroundColor(.gray)
                        Text(collectionCard.title)
                            .font(.custom("AvenirNext-Demibold", size: 15))
                    }
                    Spacer()
                }
                .background(LinearGradient(gradient: Gradient(colors: [Color(.sRGB, red: 183/255, green: 283/255, blue: 169/255, opacity: 0.85),.white]), startPoint: .trailing, endPoint: .leading))
                .offset(x: 10, y: -8)
                .padding(.horizontal, 10)
                ProductsView()
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

//struct ParallaxView_Previews: PreviewProvider {
//    static var previews: some View {
//        ParallaxView(productCards:
//            
//            [
//                ProductCard(withId: 1, withtitle: "Clock", andVendorName: "Jenkins", andPrice: 29.99, andQuantity: 40, andImage: "shopify-robot-testdata", andIsFavourite: false),
//                ProductCard(withId: 1, withtitle: "Clock", andVendorName: "Jenkins", andPrice: 29.99, andQuantity: 40, andImage: "shopify-robot-testdata", andIsFavourite: false),
//                ProductCard(withId: 1, withtitle: "Clock", andVendorName: "Jenkins", andPrice: 29.99, andQuantity: 40, andImage: "shopify-robot-testdata", andIsFavourite: false),
//                ProductCard(withId: 1, withtitle: "Clock", andVendorName: "Jenkins", andPrice: 29.99, andQuantity: 40, andImage: "shopify-robot-testdata", andIsFavourite: false),
//                ProductCard(withId: 1, withtitle: "Clock", andVendorName: "Jenkins", andPrice: 29.99, andQuantity: 40, andImage: "shopify-robot-testdata", andIsFavourite: false),
//                ProductCard(withId: 1, withtitle: "Clock", andVendorName: "Jenkins", andPrice: 29.99, andQuantity: 40, andImage: "shopify-robot-testdata", andIsFavourite: false),
//                ProductCard(withId: 1, withtitle: "Clock", andVendorName: "Jenkins", andPrice: 29.99, andQuantity: 40, andImage: "shopify-robot-testdata", andIsFavourite: false)
//                
//        ], collectionCard: CollectionCard(withId: 1, withImage: "shopify-robot-testdata", andBackgroundImage: "", andTitle: "Awesome Collection", andSubtitle: "", andDescription: "", andIsOnSale: false))
//        
//        
//    }
//}
