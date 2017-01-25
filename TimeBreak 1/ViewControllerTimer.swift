//
//  ViewControllerTimer.swift
//  TimeBreak 1
//
//  Created by Maria Madalena Teles on 1/15/17.
//  Copyright © 2017 Maria Madalena Teles. All rights reserved.
//

import UIKit

class ViewControllerTimer: UIViewController {
    
    @IBOutlet var taskLabel: UILabel!
    
    @IBOutlet var CountDownTimerLabel: UILabel!
    
    
    @IBOutlet var startButton: UIButton!
    
    
    @IBOutlet var snoozeButton: UIButton!
    
    
    var taskName = ""
    var timeForTask = 0
    var seconds = 60
    var timer = Timer ()
    var isTimerRunning = false
    var resumeTapped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        taskLabel.text = taskName
        
    }
    
    @IBAction func BackButtonTapped(_ sender: UIButton) {
        
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func StartButtonTapped(_ sender: UIButton) {
        if isTimerRunning == false {
            runTimer(isTimerRunning = true)
            self.startButton.isEnabled = false
        }
    }
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(ViewControllerTimer.updateTimer)), userInfo: nil, repeats: true)
        isTimerRunning = true
        self.snoozeButton.isEnabled = true
    }
    
    @IBAction func SnoozeButtonTapped(_ sender: UIButton) {
        if self .resumeTapped == false {
            timer.invalidate()
            self.resumeTapped = true
        } else {
            runTimer()
            self.resumeTapped = false
    
        }
    }
    
    @IBAction func ResetButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        seconds = 60
        CountDownTimerLabel.text = timeString(time: TimeInterval(seconds))
        isTimerRunning = false
        self.snoozeButton.isEnabled = false
        
    }
    
    func updateTimer(){
        if seconds < 1 {
            timer.invalidate()
        } else {
            seconds -= 1
            CountDownTimerLabel.text = timeString(time: TimeInterval(seconds))
        }
        }
    
    func timeString(time:TimeInterval) -> String {
        let Hours = Int(time) / 3600
        let Minutes = Int(time) / 60 % 60
        let Seconds = Int(time) % 60
        
        return String(format: "%02i:%02i:%02i", Hours, Minutes, Seconds)
        
    }
    
  
    
}











