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
    /// Initializing default settings for components of the form view
    @State var receive = false
    @State var selection = 1
    @State var date = Date()
    @State var submit = false
    
    @EnvironmentObject var shoppingCart: ShoppingCart
    
    var body: some View {
        HStack(alignment: .top) {
            Form {
                Section(header: Text("Shipping address")) {
                    Picker(selection: $selection, label: Text("Shopify Office")) {
                        Text("80 Spadina Ave #400, Toronto, ON M5V 2J4").tag(1)
                        Text("150 Elgin St, Ottawa, ON K2P 1L4").tag(2)
                        Text("490 Rue De La Gauchetière O, Montréal, QC H2Z 0B3").tag(3)
                        Text("57 Erb St W, Waterloo, ON N2L 6C2").tag(4)
                        Text("33 New Montgomery St #750, San Francisco, CA 94105").tag(5)
                    }
                }
                Section(header: Text("Shipping Details")) {
                    HStack {
                        VStack(alignment: .leading, spacing: 5) {
                            Text("Items(\(shoppingCart.items.count)):")
                                .foregroundColor(.secondary)
                            Text("Shipping:")
                                .foregroundColor(.secondary)
                            Text("Total before tax:")
                                .foregroundColor(.secondary)
                            Text("Estimated GST/HST:")
                                .foregroundColor(.secondary)
                            Text("Order Total:")
                                .font(.system(size: 20, weight: .bold, design: .default))
                            
                        }
                        Spacer()
                        VStack(alignment: .trailing, spacing: 5) {
                            Text("$\(shoppingCart.getTotalPrice(), specifier: "%.2f")")
                                .foregroundColor(.secondary)
                            Text("$\(shoppingCart.getShippingPrice(), specifier: "%.2f")")
                                .foregroundColor(.secondary)
                            Text("$\(shoppingCart.getSubtotal(), specifier: "%.2f")")
                                .foregroundColor(.secondary)
                            Text("$\(shoppingCart.getGST(), specifier: "%.2f")")
                                .foregroundColor(.secondary)
                            Text("$\(shoppingCart.getOrderTotal(), specifier: "%.2f")")
                                .font(.system(size: 20, weight: .bold, design: .default))
                                .foregroundColor((Color(.sRGB, red: 174/255, green: 22/255, blue: 0/255, opacity: 0.75)))
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
                    Button(action: {
                        self.submit.toggle()
                        self.shoppingCart.items.removeAll()
                    }) {
                        Text("Submit Order")
                    }
                }
                .alert(isPresented: $submit, content: {
                    Alert(title: Text("Your order has been shipped"), message: Text("Enjoy!"))
                })
            }
            .navigationBarTitle("Checkout Order")
        }
    }
}


