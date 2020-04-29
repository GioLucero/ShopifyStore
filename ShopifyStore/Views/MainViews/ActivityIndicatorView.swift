//
//  ActivityIndicatorView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-04-05.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

/// displays loading animation while data is being loaded
struct ActivityIndicator: UIViewRepresentable {

    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}
