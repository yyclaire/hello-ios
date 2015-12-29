//
//  ViewController2.swift
//  tips
//
//  Created by david on 12/27/15.
//  Copyright (c) 2015 david. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var rPeopleLabel: UILabel!
    @IBOutlet weak var rSlider: UISlider!
    @IBOutlet weak var rImageView0: UIImageView!
    
    @IBOutlet weak var rImageView1: UIImageView!
    @IBOutlet weak var rImageView2: UIImageView!
    @IBOutlet weak var rImageView3: UIImageView!
    @IBOutlet weak var rImageView4: UIImageView!
    @IBOutlet weak var rImageView5: UIImageView!
    @IBOutlet weak var rImageView6: UIImageView!
    @IBOutlet weak var rImageView7: UIImageView!
    @IBOutlet weak var rGoButton: UIButton!
    let images = [
        UIImage(named:"person_deselected.png"),
        UIImage(named:"person_selected.png")
    ]
    //var rImageViews : [UIImageView]
    
    
    var imageModulus = 4
    var players = 2
    let animationDuration: NSTimeInterval = 0.25
    let switchingInterval: NSTimeInterval = 3
    var rouletteStart = false
    override func viewDidLoad() {
        super.viewDidLoad()


        // Do any additional setup after loading the view.
        rouletteReset(2)
        var timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target:self, selector:"rouletteUpdate", userInfo:nil, repeats: true)
        
    }
    
    func rouletteReset(modulus: Int){
        players = modulus
        var rImageViews = [
            rImageView0!,
            rImageView1!,
            rImageView2!,
            rImageView3!,
            rImageView4!,
            rImageView5!,
            rImageView6!,
            rImageView7!
        ]
        
        rImageView0.image = images[1]
        rImageView1.image = images[0]
        rImageView2.image = images[0]
        rImageView3.image = images[0]
        rImageView4.image = images[0]
        rImageView5.image = images[0]
        rImageView6.image = images[0]
        rImageView7.image = images[0]
        
            imageModulus = modulus
            for index in 0...7{
                if index < imageModulus{
                    rImageViews[index].hidden = false
                }else{
                    rImageViews[index].hidden = true
                }
            }
        
        
    }
    @IBAction func onPeopleSlide(sender: AnyObject) {
        rPeopleLabel.text = "\(Int(rSlider.value))"
        rouletteReset(Int(rSlider.value))
    }
    @IBAction func onTap(sender: AnyObject) {
        if rouletteStart{
            rGoButton.setTitle("GO!", forState:.Normal)
            rouletteStop()
        }else {
            rGoButton.setTitle("STOP!",
                forState:.Normal)
            rouletteRun()
        }
    }
    
    func rouletteRun(){
        rouletteStart=true
    }
    func rouletteStop(){
        rouletteStart = false
    }
    var index = 0
    func rouletteUpdate(){
        if rouletteStart{
            var rImageViews = [
                rImageView0!,
                rImageView1!,
                rImageView2!,
                rImageView3!,
                rImageView4!,
                rImageView5!,
                rImageView6!,
                rImageView7!
            ]
            
            rImageView0.image = images[0]
            rImageView1.image = images[0]
            rImageView2.image = images[0]
            rImageView3.image = images[0]
            rImageView4.image = images[0]
            rImageView5.image = images[0]
            rImageView6.image = images[0]
            rImageView7.image = images[0]
            
            
                var modulus = (index++)%imageModulus
                rImageViews[modulus].image = images[1]
            
            
        }
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
