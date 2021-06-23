//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft": 5, "Medium": 420, "Hard": 720]
    var counter : Int = 0
    var timer = Timer()
    var percent = 0.0
    var hardness = ""
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timerProgress: UIProgressView!
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer.invalidate()
        hardness = sender.currentTitle!
        
        counter = eggTimes[hardness]!
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateCounter(){
        if counter > 0 {
            print("Time Left: \(counter)")
            percent = (1 - Double(counter)/Double(eggTimes[hardness]!))
            timerProgress.progress = Float(percent)
            counter -= 1
        } else {
            timerProgress.progress = 1.0
            titleLabel.text = "DONE"
        }
    }
    

}
