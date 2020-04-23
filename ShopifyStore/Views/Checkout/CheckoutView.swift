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
    
    var body: some View {
        NavigationView {
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
                                Text("Items:")
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
                                        Text("total1")
                                            .foregroundColor(.primary)
                                            .padding(.horizontal, 60)
                                            .padding(.bottom, 20)
                                        
                                        Text("total2")
                                            .foregroundColor(.primary)
                                            .padding(.horizontal, 60)
                                        
                                        Text("total3")
                                            .foregroundColor(.primary)
                                            .padding(.horizontal, 60)
                                        Text("total4")
                                            .foregroundColor(.primary)
                                            .padding(.horizontal, 60)
                                        Text("total")
                                            .font(.system(size: 20, weight: .bold, design: .default))
                                            .padding(.top, 15)
                                            .padding(.horizontal, 60)
                                    }
                                }
                            }
                        }
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
                    Alert(title: Text("Thanks, your order has been shipped!"), message: Text("Your reciept has been sent to: \(email)"))
                })
                
            }
            .navigationBarTitle("Checkout Order")
        }
    }
}


//func getShippingPrice() -> Double {
//
//}
//
//func getSubtotal() -> Double {
//
//}
//
//func getGST() -> Double {
//
//}
//
//func getOrderTotal() -> Double {
//
//}

