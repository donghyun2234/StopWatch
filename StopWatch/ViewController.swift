//
//  ViewController.swift
//  StopWatch
//
//  Created by Mauro Sabatino  on 24/02/2018.
//  Copyright © 2018 Mauro Sabatino . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    weak var timer: Timer?
    var startTime: Double = 0
    var time: Double = 0
    var elapsed: Double = 0

    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var secondLbl: UILabel!
    @IBOutlet weak var minuteLbl: UILabel!
    
    @IBOutlet weak var stopBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minuteLbl.text = "00"
        secondLbl.text = "00"
        
    }
    
    @IBAction func startTimer(_ sender: Any) {
        startTime = Date().timeIntervalSinceReferenceDate - elapsed
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @IBAction func stopTimer(_ sender: Any) {
        timer?.invalidate()
        minuteLbl.text = "00"
        secondLbl.text = "00"
    }
    @objc func updateCounter() {
        
        // Calculate total time since timer started in seconds
        time = Date().timeIntervalSinceReferenceDate - startTime
        
        // Calculate minutes
        let minutes = UInt8(time / 60.0)
        time -= (TimeInterval(minutes) * 60)
        
        // Calculate seconds
        let seconds = UInt8(time)
        time -= TimeInterval(seconds)
        
        // Format time vars with leading zero
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        
        // Add time vars to relevant labels
        minuteLbl.text = strMinutes
        secondLbl.text = strSeconds
        
    }
    



}

