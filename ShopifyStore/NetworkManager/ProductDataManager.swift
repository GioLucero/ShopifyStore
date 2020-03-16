//
//  ProductData.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-15.
//  Copyright © 2020 Gio Lucero. All rights reserved.
//

class ProductDataManager: BindableObject {
    private static let apiUrlString = "https://shopicruit.myshopify.com/admin/products.json?access_token=c32313df0d0ef512ca64d5b336a0d7c6"
    var didChange = PassthroughSubject<ProductFetcher, Never>()
    
    var state: LoadableState<Root> = .loading {
        didSet {
            didChange.send(self)
        }
    }
    
    init() {
        guard let apiUrl = URL(string: ProductDataManager.apiUrlString) else {
            state = .fetched(.failure(.error("Malformed API URL.")))
            return
        }
        
        URLSession.shared.dataTask(with: apiUrl) { [weak self] (data, _, error) in
            if let error = error {
                self?.state = .fetched(.failure(.error(error.localizedDescription)))
                return
            }
            
            guard let data = data else {
                self?.state = .fetched(.failure(.error("Malformed response data")))
                return
            }
            let root = try! JSONDecoder().decode(Root.self, from: data)
            
            DispatchQueue.main.async { [weak self] in
                self?.state = .fetched(.success(root))
            }
        }.resume()
    }
}
