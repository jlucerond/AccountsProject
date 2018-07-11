//
//  AccountController.swift
//  Charter
//
//  Created by Joe Lucero on 7/11/18.
//  Copyright © 2018 Joe Lucero. All rights reserved.
//

import Foundation

protocol AccountControllerDelegate: class {
   func accountsUpdated()
}

class AccountController {
   private (set) var accounts: [Account] = []
   
   weak var delegate: AccountControllerDelegate?
   
   init() {
      NetworkController.getAccountInfo { [weak self] (accounts) in
         guard let strongSelf = self else {
            return
         }
         
         if let accounts = accounts {
            strongSelf.accounts = accounts
            strongSelf.delegate?.accountsUpdated()
         }
      }
   }
}
