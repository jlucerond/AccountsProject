//
//  CurrencyFormatter.swift
//  Charter
//
//  Created by Joe Lucero on 7/11/18.
//  Copyright © 2018 Joe Lucero. All rights reserved.
//

import Foundation

struct CurrencyFormatter {
   static func getSringFrom(dollarAmount: Double) -> String? {
      let formatter = NumberFormatter()
      formatter.numberStyle = .currency
      
      return formatter.string(from: NSNumber(value: dollarAmount))
   }
   
}
