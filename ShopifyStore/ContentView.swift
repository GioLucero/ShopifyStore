//
//  ContentView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-02-29.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI
import Combine

struct ContentView: View {
    /// Model that stores the data from the customCollection API
    @ObservedObject var collectionCardViewModel = CollectionViewModel.shared
    /// Displays a loading screen as the default
    @State var isLoading = true
    
    
    var body: some View {
        ZStack {
            /// Attempts loading screen
            if isLoading {
                ActivityIndicator(isAnimating: $isLoading, style: .large)
            } else {
                NavigationView {
                    ScrollView {
                        ExtractedView()
                            .padding(.vertical, 10)
                        // insert featured banner here
                        /// Creating a list of collection cards
                        ForEach(collectionCardViewModel.collectionCards, id: \.self) { collectionCard in
                            VStack(alignment: .leading) {
                                /// Once the collection clicked, it will direct the user to the next page
                                NavigationLink(destination: ParallaxView(description: collectionCard.description, parallaxImageName: collectionCard.image, customCollectionID: collectionCard.id)) {
                                    CollectionCardView(customCollectionCard: collectionCard)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                    }
                    .navigationBarTitle("Collections")
                    .navigationBarItems(trailing:
                        Button(action: {
                            print("User icon pressed...")
                        }) {
                            NavigationLink(destination: ProfileView()) {
                                Image(systemName: "person.crop.circle").imageScale(.large)
                            }
                    })
                }
            }
        }
            /// Display data when loading is successful
            .onAppear {
                if self.isLoading {
//                    UINavigationBar.appearance().backgroundColor = .(Color(.sRGB, red: 21/255, green: 1/255, blue: 62/255))
                    self.collectionCardViewModel.getCustomCollectionData { collectionCards in
                        self.collectionCardViewModel.collectionCards = collectionCards
                        self.isLoading = false
                    }
                }
        }
    }
}


// Passing information to parallaxView banner
//var collections = ProductCard(withId: 12, withtitle: "Featured Product", andDescription: "", andVendorName: "", andPrice: 1, andQuantity: 1, andImage: UIImage())




struct ExtractedView: View {
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("Fall Products")
                        .font(.system(size: 24, weight: .bold))
                        .foregroundColor(.white)
                    Text("18 Collections")
                        .foregroundColor(Color.white.opacity(0.7))
                }
                Spacer()
                ZStack {
                    Image("shopify-logo")
                        .resizable()
                        .frame(width: 75, height: 75)
                    
                    
                    VStack {
                        Image(systemName: "shopify-logo")
                            .resizable()
                            .frame(width: 20, height: 20)
                    }
                    .frame(width: 36, height: 36)
                    .clipShape(Circle())
                }
            }
            Spacer()
        }
        .padding(20)
            //        .frame(width: show ? screen.width : screen.width - 60, height: show ? screen.height : 280)
            .frame(width: 335, height: 125)
            .background(Color(.sRGB, red: 21/255, green: 1/255, blue: 62/255))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color(.sRGB, red: 21/255, green: 1/255, blue: 62/255, opacity: 0.5).opacity(0.3), radius: 20, x: 0, y: 20)
    }
}
