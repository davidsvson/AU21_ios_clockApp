//
//  ViewController.swift
//  ClockApp
//
//  Created by David Svensson on 2021-11-18.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    let formatter = DateFormatter()
    
    var timer: Timer?
    
    let startTime = 6.0
    
    var player1time = 0.0
    var player2time = 0.0
    var player1active = true
    
    var lastTime = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resetPlayerTime()
        
        updateTimelabel()
    }
    
    func resetPlayerTime() {
        player1time = startTime
        player2time = startTime
    }
    
    @IBAction func onTap(_ sender: UITapGestureRecognizer) {
        if timer != nil  {
            switchPlayer()
        } else {
            startClock()
        }
        
    }
    
    func switchPlayer() {
        player1active.toggle()
    }
    
    func startClock() {
        resetPlayerTime()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true, block: updateTime(timer:))
        lastTime = Date()
    }
    
    func updateTime(timer: Timer? = nil) {
        
        let newTime = Date()
        let deltaTime = newTime.timeIntervalSince(lastTime)
        
        if player1active {
            player1time -= deltaTime
        } else {
            player2time -= deltaTime
        }
        
        lastTime = newTime
        
        updateTimelabel()
        
        if player2time < 0.1 || player1time < 0.1 {
            timer?.invalidate()
        }
    }
    
    func updateTimelabel() {
        let newTimeString = "\(String(format: "%.2f", player1time))   :   \(String(format: "%.2f", player2time))"
        
        timeLabel.text = newTimeString
    }
    
    deinit {
        timer?.invalidate()
    }
}


//class Player {
//
//
//    var timeLeft : Double
//
//    init(timeLeft: Double) {
//        self.timeLeft = timeLeft
//    }
//}



//        var numberString : String?
//
//        //version 0 --- GÖR EJ -- KOMMER KRACHA -- KOMMER FÅ DÅLIGA REVIEWS
//        let number = Int(numberString!)
//        let bigNumber = number! + 4
//        print(bigNumber)

//        //version 1
//        if let numberString = numberString {
//            if let number = Int(numberString) {
//                let bigNumber = number + 4
//                print(bigNumber)
//            }
//        }

//        //version 2
//        if let numberString = numberString,
//           let number = Int(numberString) {
//                let bigNumber = number + 4
//                print(bigNumber)
//            }
//        }

//        //version 3
//        if let number = Int(numberString ?? "") {
//            let bigNumber = number + 4
//            print(bigNumber)
//        }

//        //version 4
//        guard let numberString = numberString else { return }
//        guard let number = Int(numberString) else { return }
//
//        let bigNumber = number + 4
//        print(bigNumber)

