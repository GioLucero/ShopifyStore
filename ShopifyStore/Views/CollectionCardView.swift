//
//  ProductCardView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-02-29.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

struct CollectionCardView: View {
    
    @State var productCard: CollectionCard
    
    var body: some View {
        VStack {
            Image(productCard.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Image("Featured-Card-Bg"))
                .clipped()
                .aspectRatio(contentMode: .fit)
            
            HStack {
                VStack(alignment: .leading) {
                    Text(productCard.subtitle)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(productCard.title)
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
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.5), lineWidth: 1)
        )
            .padding(.top, 30)
            .padding(.horizontal, 30)
        
    }
}



struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        
        CollectionCardView(productCard: CollectionCard(withId: 10, withImage: "shopify-robot-testdata", andBackgroundImage: "", andTitle: "Title", andSubtitle: "Subtitle", andDescription: "The top of the line of aerodynamic products all in the same collection.", andIsOnSale: true))
    }
}
