//
//  NetworkModel.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-14.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

// this model must conform to Decodable and Identifiable as they will be constructed by JSONDecoder
typealias NetworkModel = Decodable & Identifiable

struct Root: Decodable {
    var products: [Product]
}

struct Product: NetworkModel {
    var id: Int
    
    let title, body_html, vendor: String
    let variants: [Variant]
    let image: ProductImage
}

struct Variant: NetworkModel {
    var id: Int
    
    let title, price: String
}

struct ProductImage: NetworkModel {
    var id: Int

    let src: String
}
