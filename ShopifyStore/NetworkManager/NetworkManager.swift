//
//  NetworkManager.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-14.
//  Copyright © 2020 Gio Lucero. All rights reserved.

import UIKit
import Alamofire
import SwiftyJSON


/// Handles all server related stuff.
class NetworkManager {
    
    /// Shared Singleton for global instance of Network Manager
    public static let shared = NetworkManager()
    
    /// API's
    public static let productURL = "https://shopicruit.myshopify.com/admin/products.json"
    public static let customCollectURL = "https://shopicruit.myshopify.com/admin/custom_collections.json"
    public static let collectionURL = "https://shopicruit.myshopify.com/admin/collects.json"
    
    /// Access Token for API URL's
    public static let accessToken: String = "c32313df0d0ef512ca64d5b336a0d7c6"
    
    /// API Call - return the JSON data from API 
    public func getCardData(withURL url: String, andParameters parametersTemp: Parameters = Parameters(), completion: @escaping (JSON) -> Void) {
        
        /// Parameters being set to perform the GET request
        
        var parameters = parametersTemp
        
        /// Using the access token to access the API
        parameters["access_token"] = NetworkManager.accessToken
        
        /// Making the GET request (default in Alamofire)
        let request = AF.request(url, parameters: parameters)
        request.responseJSON { response in
            /// DispatchQueue executes a line of code in the main thread (primary source of execution)
            DispatchQueue.main.async {
                /// once the request is executed, we want to let it run till a json response is found
                if let json = response.value {
                    print(json)
                    completion(JSON(json))
                    /// if the json is not found, return an error
                } else if let error = response.error {
                    completion(JSON(error.localizedDescription))
                }
            }
        }
    }
}






