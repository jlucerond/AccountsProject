//
//  Account.swift
//  Charter
//
//  Created by Joe Lucero on 7/11/18.
//  Copyright © 2018 Joe Lucero. All rights reserved.
//

import Foundation

struct Account: Decodable {
   let name: String
   let amount: Double
   let roi: Double
   let identifier: Double
   
   enum CodingKeys: String, CodingKey {
      case name
      case amount
      case roi = "ROI"
      case identifier = "id"
   }
   
   var initialAmount: Double {
      return (amount / (1 + roi/100))
   }
}
