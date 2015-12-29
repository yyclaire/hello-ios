//
//  SettingsViewController.swift
//  tips
//
//  Created by david on 12/28/15.
//  Copyright (c) 2015 david. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var settingsSegmentedControl: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        let controlIndex = defaults.integerForKey("default_tip_percentage")
        settingsSegmentedControl.selectedSegmentIndex = controlIndex
        // Do any additional setup after loading the view.
    }

    @IBAction func onTipPercentageChange(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(settingsSegmentedControl.selectedSegmentIndex, forKey: "default_tip_percentage")
        defaults.synchronize()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
