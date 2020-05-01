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
        ZStack {
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8) {
                        Text(customCollectionCard.title)
                            .font(.system(size: 24, weight: .bold))
                            .lineLimit(3)
                            .foregroundColor(.white)
                            .animation(nil)
                        Text(customCollectionCard.subtitle.uppercased())
                            .foregroundColor(Color.white.opacity(0.7))
                            .animation(nil)
                    }
                    Spacer()
                }
                Spacer()
                VStack {
                    Image(uiImage: customCollectionCard.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: 200)
                        .frame(height: 200, alignment: .top)
                        .background(Image("background1")
                            .resizable()
                            .foregroundColor(.white)
                            .frame(width: 250, height: 150)
                            .opacity(0.7)
                    )
                }
            }
            .padding(20)
            .frame(width: 360, height: 300)
            .background(Color("color1"))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        }
        .padding(10)
        .shadow(radius: 10)
    }
}



struct CollectionCardView_Previews: PreviewProvider {
    static var previews: some View {
        
        CollectionCardView(customCollectionCard: CollectionCard(withId: 0, withImage: "shopify-robot-testdata", andBackgroundImage: "", andTitle: "Awesome Collection", andSubtitle: "best-selling", andDescription: ""))
    }
}

