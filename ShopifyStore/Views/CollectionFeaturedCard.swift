//
//  CollectionFeaturedCard.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-01.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

struct CollectionFeaturedCard: View {
    
    @Binding var collectionCard: CollectionCard
    
    var body: some View {
        ScrollView {
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
            
            VStack(alignment: .leading) {
                HStack {
                    Image("shopify-robot-testdata")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 60, height: 60)
                        .clipped()
                        .cornerRadius(10)
                    VStack(alignment: .leading) {
                        Text("Article by")
                            .font(.custom("AvenirNext-Regular", size: 15))
                            .foregroundColor(.gray)
                        Text("Johne Doe")
                            .font(.custom("AvenirNext-Demibold", size: 15))
                    }
                }
            }
            .frame(width: 350)
        }
    }
}























//        ZStack {
//            // full view
//            VStack(spacing: 1) {
//                // Title and Subtitle
//                VStack(spacing: 1) {
//                    HStack {
//                        Text(collectionCard.title)
//                            .font(.title)
//                            .fontWeight(.bold)
//                            .foregroundColor(.white)
//                            .padding(.top)
//
//
//                        Spacer()
//                        }
//
//                        HStack {
//                            Image(systemName: "flame.fill")
//                                .foregroundColor(.orange)
//
//                            Text(collectionCard.subtitle)
//                            .font(.subheadline)
//                            .foregroundColor(.white)
//
//                            Spacer()
//                        }
//                    }
//                    .padding()
//                .padding(.bottom)
//
//
//                Image(collectionCard.image)
//                    .resizable()
//                    .frame(width: 300, height: 300)
//                    .offset(y:-30)
//
////
////                Text(collectionCard.description)
////                    .font(.subheadline)
////                    .foregroundColor(.white)
////                    .multilineTextAlignment(.center)
////                    .padding()
//
////                if collectionCard.isOnSale {
////                    Text("Limited Time")
////                        .font(.title)
////                        .foregroundColor(.green)
////                }
//            }
//            .background(Image(collectionCard.backgroundImage))
//            .edgesIgnoringSafeArea(.all)
//            .padding(.vertical, 0)
//        }
//    }
//}
