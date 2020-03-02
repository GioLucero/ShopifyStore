//
//  ContentView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-02-29.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var collectionCards: [CollectionCard]
    var body: some View {
        
        NavigationView {
            ScrollView {
                // insert featured banner here
                ForEach(collectionCards, id: \.self) { productCard in
                    CollectionCardView(productCard: productCard)
                }
            }
            .navigationBarTitle("Collections")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(collectionCards:
            
            [
                CollectionCard(withId: 20, withImage: "shopify-robot-testdata", andTitle: "Title", andSubtitle: "Subtitle", andDescription: "", andIsOnSale: false),
                
                CollectionCard(withId: 15, withImage: "shopify-robot-testdata", andTitle: "Title", andSubtitle: "Subtitle", andDescription: "", andIsOnSale: false),
            ])
    }
}
