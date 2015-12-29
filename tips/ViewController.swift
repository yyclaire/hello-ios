//
//  ViewController.swift
//  tips
//
//  Created by david on 12/27/15.
//  Copyright (c) 2015 david. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="Tip Calculator"
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        let defaults = NSUserDefaults.standardUserDefaults()
        tipControl.selectedSegmentIndex = defaults.integerForKey("default_tip_percentage")
        
        if let string1 = defaults.stringForKey("tipLabel"){
            tipLabel.text = string1
        }
        
        if let string2 = defaults.stringForKey("totalLabel"){
            totalLabel.text = string2
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        update()
    }
    
    func update(){
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        
        var billAmount:Double = 0
        if let value = billField?.text{
            billAmount = (value as NSString).doubleValue
        }
        var tip = billAmount * tipPercentage
        var total = billAmount + tip
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setValue("tipLabel", forKey:tipLabel.text)
        defaults.setValue("totalLabel", forKey:totalLabel.text)
        defaults.synchronize()
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

