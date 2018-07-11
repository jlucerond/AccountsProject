//
//  AccountsTableViewController.swift
//  Charter
//
//  Created by Joe Lucero on 7/11/18.
//  Copyright © 2018 Joe Lucero. All rights reserved.
//

import UIKit

class AccountsTableViewController: UITableViewController {

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AccountController.shared.accounts.count
    }
   
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath)
      
      let account = AccountController.shared.accounts[indexPath.row]
      cell.textLabel?.text = account.name
      cell.detailTextLabel?.text = CustomFormatter.getSringFrom(dollarAmount: account.amount)
      
      return cell
   }

}
