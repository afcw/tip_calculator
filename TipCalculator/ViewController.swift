//
//  ViewController.swift
//  TipCalculator
//
//  Created by Wanda Cheung on 9/17/14.
//  Copyright (c) 2014 Wanda Cheung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var billAmtField: UITextField!
  @IBOutlet var tipAmtLabel: UILabel!
  @IBOutlet weak var ttlAmtLabel: UILabel!
  @IBOutlet weak var tipControl: UISegmentedControl!
  @IBOutlet weak var splitField: UITextField!
  @IBOutlet weak var splitAmtLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    var defaults = NSUserDefaults.standardUserDefaults()
    tipControl.selectedSegmentIndex = defaults.integerForKey("selectedIndex")
    var splitBy = defaults.integerForKey("selectedRow")
    if splitBy > 1 {
      splitField.text = String(splitBy)
    } else {
      splitField.text = String(1)
    }
  }

  override func viewWillAppear(animated: Bool) {
    var defaults = NSUserDefaults.standardUserDefaults()
    tipControl.selectedSegmentIndex = defaults.integerForKey("selectedIndex")
    var splitBy = defaults.integerForKey("selectedRow")
    if splitBy > 1 {
      splitField.text = String(splitBy)
    } else {
      splitField.text = String(1)
    }
    calculateTip()
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  func calculateTip() {
    var tipPercentages = [0.18, 0.2, 0.22]
    var tipPct = tipPercentages[tipControl.selectedSegmentIndex]
    
    var billAmt = (billAmtField.text as NSString).doubleValue
    var splitBy = (splitField.text as NSString).integerValue
    var tip = billAmt * tipPct
    var ttlAmt = billAmt + tip
    var splitAmt = ttlAmt
    if splitBy > 1 {
      splitAmt = ttlAmt / (splitField.text as NSString).doubleValue
    }
    tipAmtLabel.text = String(format: "$%0.2f", tip)
    ttlAmtLabel.text = String(format: "$%0.2f", ttlAmt)
    
    splitAmtLabel.text = String(format: "$%0.2f", splitAmt)
  }
  
  
  @IBAction func onEditingChanged(sender: AnyObject) {
    calculateTip();
  }

  @IBAction func onTap(sender: AnyObject) {
    
    view.endEditing(true)
  }
}

