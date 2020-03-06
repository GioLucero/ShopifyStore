//
//  CollectionFeaturedCardView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-02.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

struct CollectionFeaturedCardView: View {
    var body: some View {
        // 1
                HStack {
                    
                    // 2
                    Image("person")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 55, height: 55)
                        .clipShape(Circle())
                        .shadow(radius: 4)
                    
                    // 3
                    VStack(alignment: .leading) {
                        Text("Article Written By")
                            .font(.custom("Avenir Next", size: 12))
                            .foregroundColor(.gray)
                        Text("Brandon Baars")
                            .font(.custom("Avenir Next", size: 17))
                    }
                }
            }
        }
struct CollectionFeaturedCardView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionFeaturedCardView()
    }
}
