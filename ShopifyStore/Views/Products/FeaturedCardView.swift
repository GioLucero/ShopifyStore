//
//  FeaturedCard.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-04-25.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

//import SwiftUI
//
//struct FeaturedCardView: View {
//    @State var collections = [CollectionCard]()
//    
//    var body: some View {
//        GeometryReader { geometry in
//            VStack {
//                /// Stretches image based on the position of the scroll
//                if geometry.frame(in: .global).minY <= 0 {
//                    Image(uiImage: self.collections.image)
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 300, height: 300)
//                        .offset(x: 60, y: 50)
//                        .background(Image("Featured-Card-Bg"))
//                        .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
//                        .clipped()
//                        .offset(y: -geometry.frame(in: .global).minY)
//                } else {
//                    Image(uiImage: self.collections.image)
//                        .resizable()
//                        .aspectRatio(contentMode: .fill)
//                        .frame(width: 300, height: 300)
//                        .offset(x: 60, y: 50)
//                        .background(Image("Featured-Card-Bg"))
//                        .frame(width: geometry.size.width, height: geometry.size.height + geometry.frame(in: .global).minY)
//                        .clipped()
//                        .offset(y: -geometry.frame(in: .global).minY)
//                }
//            }
//        }
//        .frame(height: 400)
//    }
//}
//
//struct FeaturedCardView_Previews: PreviewProvider {
//    static var previews: some View {
//        FeaturedCardView()
//    }
//}
