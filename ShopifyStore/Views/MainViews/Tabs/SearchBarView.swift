//
//  SearchBarView.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-09.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

import SwiftUI

struct SearchTab: View {
    /// test data for the search bar functionality
    let array = ["Aerodynamic", "Awesome", "Durable", "Enormous", "Ergonomic", "Fantastic", "Gorgeous", "Heavy Duty", "Incredible", "Intellegent", "Lightweight", "Mediocre", "Practical", "Rustic", "Sleek", "Small", "Synergistic"]
    @State private var searchText = ""
    @State private var showCancelButton: Bool = false
    /// Passing collection names into the search bar array
    @ObservedObject var collectionCardViewModel = CollectionViewModel.shared

    var body: some View {

        NavigationView {
            VStack {
                /// Search view
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")

                        TextField("search", text: $searchText, onEditingChanged: { isEditing in
                            self.showCancelButton = true
                        }, onCommit: {
                            print("onCommit")
                        }).foregroundColor(.primary)

                        /// reuturn a string
                        Button(action: {
                            self.searchText = ""
                        }) {
                            Image(systemName: "xmark.circle.fill").opacity(searchText == "" ? 0 : 1)
                        }
                    }
                    .padding(EdgeInsets(top: 8, leading: 6, bottom: 8, trailing: 6))
                    .foregroundColor(.secondary)
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10.0)

                    if showCancelButton  {
                        Button("Cancel") {
                                UIApplication.shared.endEditing(true) // this must be placed before the other commands here
                                self.searchText = ""
                                self.showCancelButton = false
                        }
                        .foregroundColor(Color(.systemBlue))
                    }
                }
                .padding(.horizontal)
                .navigationBarHidden(showCancelButton) // .animation(.default) // animation does not work properly

                List {
                    /// Filtered list of names
                    ForEach(array.filter{$0.hasPrefix(searchText) || searchText == ""}, id:\.self) {
                        searchText in Text(searchText)
                    }
                }
                .navigationBarTitle(Text("Search"))
                .resignKeyboardOnDragGesture()
            }
        }
    }
}



struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
           SearchTab()
              .environment(\.colorScheme, .light)

           SearchTab()
              .environment(\.colorScheme, .dark)
        }
    }
}

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}

struct ResignKeyboardOnDragGesture: ViewModifier {
    var gesture = DragGesture().onChanged{_ in
        UIApplication.shared.endEditing(true)
    }
    func body(content: Content) -> some View {
        content.gesture(gesture)
    }
}

extension View {
    func resignKeyboardOnDragGesture() -> some View {
        return modifier(ResignKeyboardOnDragGesture())
    }
}


