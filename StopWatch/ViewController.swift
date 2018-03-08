//
//  ViewController.swift
//  StopWatch
//
//  Created by Mauro Sabatino  on 24/02/2018.
//  Copyright © 2018 Mauro Sabatino . All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{
 
    weak var timer: Timer?
    var startTime: Double = 0
    var time: Double = 0
    var elapsed: Double = 0
    var stepNmr: Int = 0
    var stesps : [String] = []

    @IBOutlet weak var startBtn: UIButton!
    @IBOutlet weak var secondLbl: UILabel!
    @IBOutlet weak var minuteLbl: UILabel!
    
    @IBOutlet weak var stopBtn: UIButton!
    @IBOutlet weak var stepBtn: UIButton!
    
    @IBOutlet weak var stepTable: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        minuteLbl.text = "00"
        secondLbl.text = "00"
        
    }
    
    @IBAction func startTimer(_ sender: Any) {
        startTime = Date().timeIntervalSinceReferenceDate - elapsed
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }
    
    @IBAction func addStep(_ sender: Any) {
        stesps.append(minuteLbl.text!+""+secondLbl.text!)
        stepTable.beginUpdates()
        let indexPath = IndexPath(row: stesps.count - 1, section: 0)
        stepTable.insertRows(at: [indexPath], with: .automatic)
        stepTable.endUpdates()
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stesps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = stepTable.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = stesps[indexPath.row]
        return cell
    }
    
 
    
    



}

