//
//  ViewController.swift
//  Timer
//
//  Created by Paul Baranay on 2/14/17.
//  Copyright © 2017 Paul Baranay. All rights reserved.
//

import Foundation
import UIKit

let start_time = 3

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var startLabel: UIButton!
    @IBOutlet weak var pauseLabel: UIButton!
    @IBOutlet weak var stopLabel: UIButton!
    
    var seconds = start_time
    var display_minutes = String(format: "%02d", 0)
    var display_seconds = String(format: "%02d", 0)
    var timer = Timer()
    var timerIsOn = false
    
    func startButton() {
        
        if timerIsOn == false {
            timer = Timer.scheduledTimer(timeInterval: 1,
                                         target: self, selector: ("updateTimer"), userInfo: nil, repeats: true)
            timerIsOn = true
        }
    }
    
    func stopButton() {
        
        timer.invalidate()
        seconds = start_time
        display_minutes = String(format: "%02d", seconds / 60)
        display_seconds = String(format: "%02d", seconds % 60)
        timerLabel.text = "\(display_minutes):\(display_seconds)"
        timerIsOn = false
    }
    
    func pauseButton() {
    
        timer.invalidate()
        timerIsOn = false
    }
    
    @IBAction func handleTimer(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            startButton()
        case 2:
            pauseButton()
        case 3:
            stopButton()
        default:
            print("error")
        }
    }

    func updateTimer() {
        
        seconds -= 1
        display_minutes = String(format: "%02d", seconds / 60)
        display_seconds = String(format: "%02d", seconds % 60)
        timerLabel.text = "\(display_minutes):\(display_seconds)"
        if seconds <= 0 {
            timer.invalidate()
            timerIsOn = false
            seconds = start_time // Restarts timer properly when "Start" is pressed
        }
        
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

