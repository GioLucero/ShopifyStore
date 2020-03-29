//
//  TabBarView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-09.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//
//import SwiftUI
//import Combine
//
//struct TabBar: View {
//    @State var collectionCards: CollectionCard
//    @State var searchBar: SearchBarView
//    
//   var body: some View {
//      TabView {
//        ContentView(collectionCards: [CollectionCard], searchBar: SearchBarView).tabItem {
//            Image(systemName: "house")
//            Text("Home")
//         }
//         .tag(1)
////         SettingsTab().tabItem {
////            Image(systemName: "gear")
////            Text("Settings")
////         }
////         .tag(2)
//      }
//      .edgesIgnoringSafeArea(.top)
//   }
//}
//
//#if DEBUG
//struct TabBar_Previews: PreviewProvider {
//   static var previews: some View {
//    Group {
//        TabBar(collectionCards: [CollectionCard], searchBar: SearchBarView)
//            .environment(\.colorScheme, .light)
//        TabBar(collectionCards: [CollectionCard], searchBar: SearchBarView)
//            .environment(\.colorScheme, .dark)
//      }
//   }
//}
//#endif
