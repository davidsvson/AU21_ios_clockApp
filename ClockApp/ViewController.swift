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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loadg the view.
        
        formatter.timeStyle = .medium
        
        updateTimeLabel()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true, block: updateTimeLabel(timer:))
        
//        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) {
//            timer in
//            let date = Date()
//            let timeString = self.formatter.string(from: date)
//
//            self.timeLabel.text = timeString
//
//        }
    }
    

    func updateTimeLabel(timer: Timer? = nil) {
        let date = Date()
        let timeString = formatter.string(from: date)
        
        timeLabel.text = timeString
        
    }
    
    deinit {
//        if let timer = timer {
//            timer.invalidate()
//        }
       
        timer?.invalidate()
        
    }


}






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

