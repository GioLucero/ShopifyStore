//
//  OrderView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-04-22.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

struct ShoppingCartView: View {
    
    @EnvironmentObject var shoppingCart: ShoppingCart
    
    @State private var action: Int? = 0
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(shoppingCart.items, id: \.self) { product in
                        ProductCardView(productCard: product, isShoppingCartView: true)
                    }
                    .onDelete(perform: deleteItems)
                }
                .navigationBarTitle("Your Shopping Cart")
                .navigationBarItems(trailing: EditButton())
                
                ZStack {
                    NavigationLink(destination: CheckoutView(), tag: 1, selection: $action ) { EmptyView() }
                    
                    Button(action: {
                        self.action = 1
                    }, label: {
                        
                        Text("Checkout Total: \(shoppingCart.getTotalPrice())")
                            .foregroundColor(.white)
                            .font(.headline)
                            .fontWeight(.bold)
                            .frame(width: 300, height: 80)
                            .background(Color.black)
                            .cornerRadius(18)
                    })
                }
            }
        }.onAppear {
            self.action = 0
        }
    }
    
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
