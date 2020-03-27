//
//  NetworkManager.swift
//  ShopifyStore
//
//  Created by Gio Lucero on 2020-03-14.
//  Copyright © 2020 Gio Lucero. All rights reserved.

import Foundation
import Alamofire
import SwiftyJSON


/// Handles all server related stuff.
class NetworkManager {

  // Shared Singleton
  public static let shared = NetworkManager()
    
  // API's
  public static let productURL = "https://shopicruit.myshopify.com/admin/products.json"
  public static let customCollectURL = "https://shopicruit.myshopify.com/admin/custom_collections.json"
  public static let collectionURL = "https://shopicruit.myshopify.com/admin/collects.json"

  // Access Token for API URL's
  public static let accessToken: String = "c32313df0d0ef512ca64d5b336a0d7c6"
    

    public func getCardData(withURL url: String, completion: @escaping (JSON) -> Void) {

        // Parameters being set to perform the GET request
        let parameters: Parameters = [
            "access_token": NetworkManager.accessToken,
        ]
        // Defaults to .get

    
        let request = AF.request(url, parameters: parameters)
        request.responseJSON { response in
            // DispatchQueue executes a line of code in the main thread (primary source of execution)
            DispatchQueue.main.async {
                // once the request is executed, we want to let it run till a json response is found
                if let json = response.value {
                    completion(JSON(json))
                // if the json is not found, return an error
                } else if let error = response.error {
                    completion(JSON(error.localizedDescription))
                }
            }
        }
    }
    
    // Fetch UIImage
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
       URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }
    func downloadImage(from url: URL) {
       getData(from: url) {
          data, response, error in
          guard let data = data, error == nil else {
             return
          }
          DispatchQueue.main.async() {
             self.image = UIImage(data: data)
         }
       }
    }
    
    extension UIImageView {
       func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
          URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
       }
       func downloadImage(from url: URL) {
          getData(from: url) {
             data, response, error in
             guard let data = data, error == nil else {
                return
             }
             DispatchQueue.main.async() {
                self.image = UIImage(data: data)
             }
          }
       }
    }
    
    // creating a func for each API request

    
//    public func getCustomCollectionData() {
//        self.getCardData(withURL: NetworkManager.customCollectURL)
//    }
//
//    public func getCollectionData() {
//        self.getCardData(withURL: NetworkManager.collectionURL)
//    }
}






