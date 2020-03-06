//
//  CollectionFeaturedCard.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-01.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

struct CollectionFeaturedCard: View {
    @State var collectionCard: CollectionCard
    
    var body: some View {
        ZStack {
            // full view
            VStack(spacing: 1) {
                // Title and Subtitle
                VStack(spacing: 1) {
                    HStack {
                        Text(collectionCard.title)
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top)
                            
                            
                        Spacer()
                        }

                        HStack {
                            Image(systemName: "flame.fill")
                                .foregroundColor(.orange)

                            Text(collectionCard.subtitle)
                            .font(.subheadline)
                            .foregroundColor(.white)
                            
                            Spacer()
                        }
                    }
                    .padding()
                    .padding(.bottom)

                
                Image(collectionCard.image)
                    .resizable()
                    .frame(width: 300, height: 300)
                    .offset(y:-60)
        
//
//                Text(collectionCard.description)
//                    .font(.subheadline)
//                    .foregroundColor(.white)
//                    .multilineTextAlignment(.center)
//                    .padding()

//                if collectionCard.isOnSale {
//                    Text("Limited Time")
//                        .font(.title)
//                        .foregroundColor(.green)
//                }
            }
            .background(Image(collectionCard.backgroundImage))
        }
    }
}

struct CollectionFeaturedCard_Previews: PreviewProvider {
    static var previews: some View {
        CollectionFeaturedCard(collectionCard: CollectionCard(withId: 5, withImage: "shopify-robot-testdata", andBackgroundImage: "space-shopify", andTitle: "Awesome Collection", andSubtitle: "Top Rated Collection", andDescription: "The top of the line of aerodynamic products all in the same collection.", andIsOnSale: true))
    }
}
