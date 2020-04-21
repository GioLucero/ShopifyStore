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
                .background(Image("space-shopify"))
                .clipped()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                /// The description layout 
                VStack(alignment: .leading) {
                    /// Subtitle for card
                    Text(customCollectionCard.subtitle)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    /// Title for Card
                    Text(customCollectionCard.title)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                }
                .layoutPriority(1)
                Spacer()
            }
            .padding()
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

        CollectionCardView(customCollectionCard: CollectionCard(withId: 10, withImage: UIImage(), andBackgroundImage: "", andTitle: "", andSubtitle: "", andDescription: "The top of the line of aerodynamic products all in the same collection.", andIsOnSale: true))
    }
}
