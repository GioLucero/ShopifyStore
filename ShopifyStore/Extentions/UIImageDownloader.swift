//
//  UIImageDownloader.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-27.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import UIKit

/// Extention of the UIImage function from
extension UIImage {
    
    /// Passing in API url
    convenience init(fromUrl url: String) {
        /// Creates a url
        let imageURL = URL(string: url)
        
        /// Downloading the image from the given url
        if let imageData = try? Data(contentsOf: imageURL!) {
            print("DownloadedImage")
            self.init(data: imageData)!
        } else {
            print("Failed to download image from: \(url)")
            self.init()
        }
    }
}
