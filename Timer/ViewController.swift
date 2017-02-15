//
//  ViewController.swift
//  Timer
//
//  Created by Paul Baranay on 2/14/17.
//  Copyright © 2017 Paul Baranay. All rights reserved.
//

import UIKit

let start_time = 45

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    
    var seconds = start_time
    var timer = Timer()
    var timerIsOn = false
    
    @IBAction func startButton(_ sender: Any) {
        
        if timerIsOn == false {
            timer = Timer.scheduledTimer(timeInterval: 1,
                                         target: self, selector: ("updateTimer"), userInfo: nil, repeats: true)
            timerIsOn = true
        }
    }
    
    @IBAction func stopButton(_ sender: Any) {
        
        timer.invalidate()
        seconds = start_time
        timerLabel.text = "\(seconds)"
        timerIsOn = false
    }
    
    @IBAction func pauseButton(_ sender: Any) {
    
        timer.invalidate()
        timerIsOn = false
    }
    
    func updateTimer() {
        
        seconds -= 1
        timerLabel.text = "\(seconds)"
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

