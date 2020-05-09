//
//  SettingsTab.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-04-03.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

/// Settings tab within the tab bar
struct SettingsTab: View {
    /// Default settings for settings options
   @State var receive = false
   @State var date = Date()
   @State var email = ""
   @State var submit = false

   var body: some View {
      NavigationView {
         Form {
            Toggle(isOn: $receive) {
               Text("Recieve Notifications")
            }
            DatePicker(selection: $date, label: {
               Text("Date")
            })
            Section(header: Text("Email")) {
               TextField("Your email: ", text: $email)
                  .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Button(action: { self.submit.toggle() }) {
               Text("Submit")
            }
            .alert(isPresented: $submit, content: {
               Alert(title: Text("Thanks"), message: Text("Email: \(email)"))
            })
         }
         .navigationBarTitle("Settings")
      }
   }
}

#if DEBUG
struct SettingsTab_Previews: PreviewProvider {
   static var previews: some View {
      SettingsTab()
   }
}
#endif

