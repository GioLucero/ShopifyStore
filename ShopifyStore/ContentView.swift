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
    @State var searchBar: SearchBarView
    
    var body: some View {
        
        NavigationView {
            NavigationLink(destination: ParallaxView())
            ScrollView {
                 SearchBarView()
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
                CollectionCard(withId: 20, withImage: "shopify-robot-testdata", andBackgroundImage: "", andTitle: "Awesome Collection", andSubtitle: "Best-selling", andDescription: "", andIsOnSale: false),
                
                CollectionCard(withId: 15, withImage: "shopify-robot-testdata", andBackgroundImage: "shopify-space", andTitle: "Title", andSubtitle: "Subtitle", andDescription: "", andIsOnSale: false),
        ], searchBar: SearchBarView())
    }
}
