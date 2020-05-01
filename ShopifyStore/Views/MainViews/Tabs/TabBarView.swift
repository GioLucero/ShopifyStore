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
    /// Allows us to access shoppingCart data
    @EnvironmentObject var shoppingCart: ShoppingCart
    
    /// used for styling the added item notification to shopping cart tab
    @State private var badgeCount: Int = 1
    private var badgePosition: CGFloat = 2
    private var tabsCount: CGFloat = 4
    
    /// Displays tab bar with the ContentView as the home view
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .bottomLeading) {
                TabView {
                    ContentView().tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                    .tag(1)
                    ShoppingCartView().tabItem {
                        Image(systemName: "cart")
                        Text("Cart")
                    }
                    .tag(2)
                    SearchTab().tabItem {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                    .tag(3)
            
                    SettingsTab().tabItem {
                        Image(systemName: "gear")
                        Text("Settings")
                    }
                    .tag(4)
                }
                .edgesIgnoringSafeArea(.top)
                
                /// Notification for added items to shopping cart
                ZStack {
                    Circle()
                        .foregroundColor(.red)
                    
                    Text("\(self.shoppingCart.items.count)")
                        .foregroundColor(.white)
                        .font(Font.system(size: 12))
                }
                .frame(width: 15, height: 15)
                .offset(x: ( ( 2 * self.badgePosition) - 0.95 ) * ( geometry.size.width / ( 2 * self.tabsCount ) ) + 2, y: -25)
                .opacity(self.shoppingCart.items.count == 0 ? 0 : 1.0)
            }
        }
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
