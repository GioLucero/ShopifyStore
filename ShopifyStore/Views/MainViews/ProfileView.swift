//
//  ProfileView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-04-24.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

/// Creating a view to display links to personal information 
struct ProfileView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image("shopify-logo")
                .resizable()
                .frame(width: 50, height: 50)
            Text("Created by:")
                .font(.system(size: 20, weight: .semibold, design: .default))
                .foregroundColor(.secondary)
            Text("Gio Lucero")
            .font(.system(size: 30, weight: .regular, design: .default))
            
            VStack(spacing: 10) {
                Button("Resume") {UIApplication.shared.open(URL(string: "https://giolucero.github.io/Personal-Portfolio-website/images/Resume_Gio_Lucero.pdf")!)}
                Button("LinkedIn") {UIApplication.shared.open(URL(string: "https://www.linkedin.com/in/giolucero/")!)}
                Button("Github") {UIApplication.shared.open(URL(string: "https://github.com/GioLucero")!)}

            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
