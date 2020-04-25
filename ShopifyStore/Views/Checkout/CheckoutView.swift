//
//  CheckoutView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-04-23.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

struct CheckoutView: View {
    
    var body: some View {
        CheckoutOrder()
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
    }
}


struct CheckoutOrder: View {
    @State var receive = false
    @State var number = 1
    @State var selection = 1
    @State var date = Date()
    @State var email = ""
    @State var submit = false
    
    @EnvironmentObject var shoppingCart: ShoppingCart
    //    @Published var items = [ProductCard]()
    //    @State var shippingPrice = 7.99
    
    var body: some View {
        HStack(alignment: .top) {
            Form {
                Section(header: Text("Shipping address")) {
                    Picker(selection: $selection, label: Text("Shopify Office")) {
                        Text("80 Spadina Ave #400, Toronto, ON M5V 2J4").tag(1)
                        Text("150 Elgin St, Ottawa, ON K2P 1L4").tag(2)
                    }
                }
                Section(header: Text("Shipping Details")) {
                    VStack {
                        HStack {
                            VStack(alignment: .leading, spacing: 5) {
                                Text("Items(\(shoppingCart.items.count)):")
                                    .foregroundColor(.secondary)
                                Text("Shipping and Handling:")
                                    .foregroundColor(.secondary)
                                Text("Total before tax:")
                                    .foregroundColor(.secondary)
                                Text("Estimated GST/HST:")
                                    .foregroundColor(.secondary)
                                Text("Order Total:")
                                    .font(.system(size: 20, weight: .bold, design: .default))
                                    .padding(.top, 15)
                            }
                            
                            VStack {
                                HStack {
                                    VStack(alignment: .trailing, spacing: 5) {
                                        Text("$\(shoppingCart.getTotalPrice(), specifier: "%.2f")")
                                            .foregroundColor(.secondary)
                                            .padding(.horizontal, 50)
                                            .padding(.bottom, 12)
                                            .padding(.top, 8)
                                        Text("$\(shoppingCart.getShippingPrice(), specifier: "%.2f")")
                                            .foregroundColor(.secondary)
                                            .padding(.horizontal, 50)
                                        Text("$\(shoppingCart.getSubtotal(), specifier: "%.2f")")
                                            .foregroundColor(.secondary)
                                            .padding(.horizontal, 50)
                                        Text("$\(shoppingCart.getGST(), specifier: "%.2f")")
                                            .foregroundColor(.secondary)
                                            .padding(.horizontal, 50)
                                        Text("$\(shoppingCart.getOrderTotal(), specifier: "%.2f")")
                                            .font(.system(size: 20, weight: .bold, design: .default))
                                            .foregroundColor((Color(.sRGB, red: 174/255, green: 22/255, blue: 0/255, opacity: 0.75)))
                                            .padding(.top, 15)
                                            .padding(.horizontal, 40)
                                            .padding(.bottom, 10)
                                    }
                                }
                            }
                        }
                    }
                }
                
                Section(header: Text("Payment Information")) {
                    Picker(selection: $selection, label: Text("Payment Method")) {
                        Text("Credit Card").tag(1)
                        Text("Pay Pal").tag(2)
                    }
                }
                Toggle(isOn: $receive) {
                    Text("Email Notification")
                }
                DatePicker(selection: $date, label: {
                    Text("Date")
                })
                Section {
                    Button(action: { self.submit.toggle() }) {
                        Text("Submit Order")
                    }
                }
                .alert(isPresented: $submit, content: {
                    Alert(title: Text("Thanks, your order has been shipped"), message: Text("Enjoy!"))
                })
            }
        .navigationBarTitle("Checkout Order")
        }
    }
}


