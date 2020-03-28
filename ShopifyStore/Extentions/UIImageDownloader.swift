//
//  UIImageDownloader.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-27.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import UIKit

extension UIImage {
    
    convenience init(fromUrl url: String) {
        let imageURL = URL(string: url)
        
        if let imageData = try? Data(contentsOf: imageURL!) {
            print("DownloadedImage")
            self.init(data: imageData)!
        } else {
            print("Failed to download image from: \(url)")
            self.init()
        }
    }
}
