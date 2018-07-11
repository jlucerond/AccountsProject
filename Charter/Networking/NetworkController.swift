//
//  NetworkController.swift
//  Charter
//
//  Created by Joe Lucero on 7/11/18.
//  Copyright © 2018 Joe Lucero. All rights reserved.
//

import Foundation

class NetworkController {
   static func getAccountInfo(completion: @escaping (([Account]?) -> Void)) {
      let baseURLString = "https://glacial-bayou-77287.herokuapp.com/listAccounts"
      guard let baseURL = URL(string: baseURLString) else {
         print("Invalid URL for getting account info")
         completion(nil)
         return
      }
      
      URLSession.shared.dataTask(with: baseURL) { (data, response, error) in
         guard error == nil, let data = data else {
            debugNetworkingErrorInfo(response: response, error: error, fullDescription: false)
            completion(nil)
            return
         }
         
         do {
            let decoder = JSONDecoder()
            let accounts = try decoder.decode([Account].self, from: data)
            completion(accounts)
         } catch {
            print("Error decoding data from web")
            completion(nil)
         }
         
      }.resume()
   }
   
   private static func debugNetworkingErrorInfo(response: URLResponse?, error: Error?, fullDescription: Bool){
      if fullDescription {
         if let error = error as NSError? {
            print("Error code: \(error.code)")
            print()
            print(error.userInfo)
            print()
         }
         
         if let response = response as? HTTPURLResponse {
            print("HTTP Status code: \(response.statusCode)")
            print()
            print(response.allHeaderFields)
         }
      } else {
         if let error = error {
            print("Error: \(error.localizedDescription)")
            print()
         }
         
         if let response = response {
            print("Response: \(response.debugDescription)")
         }
      }
   }
   
   private init() {
      
   }
}
