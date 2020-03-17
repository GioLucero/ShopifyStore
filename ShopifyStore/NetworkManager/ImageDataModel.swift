//
//  ImageDataModel.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-16.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

struct ActivityIndicator: UIViewRepresentable {
    let style: UIActivityIndicatorView.Style
    
    func makeUIView(context: UIViewRepresentableContext<ActivityIndicator>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }
    
    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<ActivityIndicator>) {
        uiView.startAnimating()
    }
}

struct LoadableImageView: View {
    @Binding var imageDataManager: ImageDataManager
    
    init(with urlString: String) {
        imageDataManager = ImageDataManager(url: urlString)
    }
    
    var body: some View {
        if let image = UIImage(data: imageDataManager.data) {
            return AnyView(
                Image(uiImage: image).resizable()
            )
        } else {
            return AnyView(
                ActivityIndicator(style: .medium)
            )
        }
    }
}
