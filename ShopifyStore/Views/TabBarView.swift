//
//  TabBarView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-09.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI
import Combine

struct TabBar: View {
    
    var body: some View {
        TabView {
            ContentView().tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            .tag(1)
            SearchTab().tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
            .tag(2)
            SettingsTab().tabItem {
                Image(systemName: "gear")
                Text("Settings")
            }
            .tag(3)
        }
        .edgesIgnoringSafeArea(.top)
    }
}

#if DEBUG
struct TabBar_Previews: PreviewProvider {
   static var previews: some View {
    Group {
        TabBar()
            .environment(\.colorScheme, .light)
        TabBar()
            .environment(\.colorScheme, .dark)
      }
   }
}
#endif
