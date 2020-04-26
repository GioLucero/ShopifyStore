//
//  ProductCardView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-02-29.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

/// Displays the Collection card
struct CollectionCardView: View {
    /// Creating the variable to store the data from CollectionCard model
    @State var customCollectionCard: CollectionCard

    
    var body: some View {
        
        
        VStack {
            /// Collection Card Image
            Image(uiImage: customCollectionCard.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Image("shopify-light-green").shadow(radius: 10))
                .clipped()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                /// The description layout 
                VStack(alignment: .leading) {
                    /// Subtitle for card
                    Text(customCollectionCard.subtitle)
                        .font(.headline)
                        .fontWeight(.medium)
                        .foregroundColor((Color(.sRGB, red: 1/255, green: 128/255, blue: 96/255, opacity: 0.75)))
                        
                    /// Title for Card
                    Text(customCollectionCard.title)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor((Color(.sRGB, red: 0/255, green: 76/255, blue: 63/255, opacity: 0.75)))
                        .lineLimit(3)
                }
                .layoutPriority(1)
                Spacer()
            }
            .padding()
            .foregroundColor((Color(.sRGB, red: 47/255, green: 101/255, blue: 102/255, opacity: 0.75)))
        }
        .cornerRadius(15)
            /// Outline for collection card
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), lineWidth: 1)
        )
            .padding(.top, 30)
            .padding(.horizontal, 30)
    }
}



struct CollectionCardView_Previews: PreviewProvider {
    static var previews: some View {
        
        CollectionCardView(customCollectionCard: CollectionCard(withId: 0, withImage: "shopify-robot-testdata", andBackgroundImage: "", andTitle: "Awesome Collection", andSubtitle: "", andDescription: ""))
    }
}

