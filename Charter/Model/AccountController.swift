//
//  AccountController.swift
//  Charter
//
//  Created by Joe Lucero on 7/11/18.
//  Copyright © 2018 Joe Lucero. All rights reserved.
//

import Foundation

class AccountController {
   static let shared = AccountController()
   private (set) var accounts: [Account] = []
   
   private init() {
      NetworkController.getAccountInfo { (accounts) in
         if let account = accounts {
            self.accounts = accounts
         }
      }
   }
}
