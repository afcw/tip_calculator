//
//  PrefViewController.swift
//  TipCalculator
//
//  Created by Wanda Cheung on 9/17/14.
//  Copyright (c) 2014 Wanda Cheung. All rights reserved.
//

import UIKit

class PrefViewController: UIViewController {
  @IBOutlet weak var tipControl: UISegmentedControl!
  @IBOutlet weak var splitField: UITextField!
  override func viewDidLoad() {
    super.viewDidLoad()
    var defaults = NSUserDefaults.standardUserDefaults()
      
    tipControl.selectedSegmentIndex = defaults.integerForKey("selectedIndex")
    
    var defaultSplit = 1
    
    if defaults.integerForKey("selectedRow") > 1 {
      defaultSplit = defaults.integerForKey("selectedRow")
    }
    splitField.text = String(defaultSplit)

        // Do any additional setup after loading the view.
  }
  
  @IBAction func onEdit(sender: AnyObject) {
    saveDefaults()
  }
  
  override func viewWillDisappear(animated: Bool) {
    saveDefaults()
  }
  
  override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  @IBAction func onTap(sender: AnyObject) {
    saveDefaults()
    view.endEditing(true)
  }
  
  func saveDefaults() {
    var defaults = NSUserDefaults.standardUserDefaults()
    defaults.setInteger(tipControl.selectedSegmentIndex, forKey:"selectedIndex")
    var splitBy = (splitField.text as NSString).integerValue
    if splitBy > 1 {
      defaults.setInteger(splitBy, forKey:"selectedRow")
    } else {
      defaults.setInteger(1, forKey:"selectedRow")
    }
    defaults.synchronize()
  }
}