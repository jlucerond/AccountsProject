//
//  AccountsTableViewController.swift
//  Charter
//
//  Created by Joe Lucero on 7/11/18.
//  Copyright © 2018 Joe Lucero. All rights reserved.
//

import UIKit

class AccountsTableViewController: UITableViewController {
   
   // MARK: - Properties
   let accountController = AccountController()
   
   // MARK: - LifeCycle Methods
   override func viewDidLoad() {
      accountController.delegate = self
   }
   
   // MARK: - Table view data source
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return accountController.accounts.count
   }
   
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "AccountCell", for: indexPath)
      
      let account = accountController.accounts[indexPath.row]
      cell.textLabel?.text = account.name
      cell.detailTextLabel?.text = NumberFormatter.getStringFrom(dollarAmount: account.amount)
      
      return cell
   }
   
   // MARK: - Navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "ToDetailVC" {
         guard let destinationVC = segue.destination as? DetailViewController,
            let indexPath = tableView.indexPathForSelectedRow else {
               return
         }
         
         let selectedAccount = accountController.accounts[indexPath.row]
         destinationVC.account = selectedAccount
      }
   }
   
}

// MARK: - AccountControllerDelegate Methods
extension AccountsTableViewController: AccountControllerDelegate {
   func accountsUpdated() {
      DispatchQueue.main.async {
         self.tableView.reloadData()
      }
   }
   
}
