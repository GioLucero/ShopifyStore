//
//  OrderView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-04-22.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

struct ShoppingCartView: View {
    /// Model that handles all the data for the shopping cart view
    @EnvironmentObject var shoppingCart: ShoppingCart
    /// Handling the state of our views - when set to 1, the navigation link to checkout view is presented
    @State private var action: Int? = 0
    
    var body: some View {
        NavigationView {
            /// Displays the lottie animation when shopping cart is empty
            if shoppingCart.items.isEmpty {
                VStack(alignment: .center) {
                    LottieView(fileName: "LottieRobot")
                        .frame(width: 200, height: 200)
                    Text("Your Shopping Cart is Empty.")
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .padding(.bottom, 10)
                        .foregroundColor(.primary)
                    Text("Please Add items to your cart.")
                        .font(.system(size: 14, weight: .medium, design: .default))
                        .foregroundColor(.secondary)
                }
                .padding(.bottom, 30)
                
                .navigationBarTitle("Your Shopping Cart")
                
            } else {
                VStack {
                    List {
                        /// Creating a list of products added to the shopping cart
                        ForEach(shoppingCart.items, id: \.self) { product in
                            ProductCardView(productCard: product, isShoppingCartView: true)
                        }
                            /// Swipe to remove items from the shopping cart
                            .onDelete(perform: deleteItems)
                    }
                        
                        /// Edit button to remove items from list
                        .navigationBarItems(trailing: EditButton())
                        .navigationBarTitle("Your Shopping Cart")
                    
                    
                    ZStack {
                        /// Move to the checkout view
                        NavigationLink(destination: CheckoutView(), tag: 1, selection: $action ) { EmptyView() }
                        
                        /// Checkout total button - returns the total price
                        Button(action: {
                            self.action = 1
                        }, label: {
                            /// Call function to recieve total price
                            Text("Checkout Total: $\(shoppingCart.getTotalPrice(), specifier: "%.2f")")
                                .foregroundColor(.white)
                                .font(.headline)
                                .fontWeight(.bold)
                                .frame(width: 300, height: 50)
                                .background(Color(.sRGB, red: 128/255, green: 198/255, blue: 111/255).opacity(1))
                                .cornerRadius(25)
                                .padding(.vertical, 15)
                        })
                    }
                }
            }
            
        }.onAppear {
            self.action = 0
        }
    }
    /// Removes an item from the shopping cart
    func deleteItems(at offsets: IndexSet) {
        shoppingCart.items.remove(atOffsets: offsets)
    }
}

struct ShoppingCartView_Previews: PreviewProvider {
    static let order = ShoppingCart()
    static var previews: some View {
        ShoppingCartView().environmentObject(order)
    }
}
