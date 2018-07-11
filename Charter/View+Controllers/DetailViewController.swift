//
//  DetailViewController.swift
//  Charter
//
//  Created by Joe Lucero on 7/11/18.
//  Copyright © 2018 Joe Lucero. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
   
   @IBOutlet weak var initialAmountLabel: UILabel!
   @IBOutlet weak var currentAmountLabel: UILabel!
   @IBOutlet weak var roiLabel: UILabel!
   
   var account: Account? {
      didSet {
         loadViewIfNeeded()
         updateViews()
      }
   }
   
   private func updateViews() {
      guard let account = account else { return }
      
      title = account.name
      initialAmountLabel.text = NumberFormatter.getStringFrom(dollarAmount: account.initialAmount)
      currentAmountLabel.text = NumberFormatter.getStringFrom(dollarAmount: account.amount)
      roiLabel.text = NumberFormatter.getStringFrom(percent: account.roi)
      
      let backgroundView = UIView()
      backgroundView.alpha = 0.3
      backgroundView.frame = view.frame
      
      if account.roi == 0 {
         backgroundView.backgroundColor = .white
      } else if account.roi < 0 {
         backgroundView.backgroundColor = .red
      } else {
         backgroundView.backgroundColor = .green
      }
      view.addSubview(backgroundView)
      view.sendSubview(toBack: backgroundView)
   }
   
}
