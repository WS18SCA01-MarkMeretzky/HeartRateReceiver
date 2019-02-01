//
//  ViewController.swift
//  HeartRateReceiver
//
//  Created by Mark Meretzky on 2/1/19.
//  Copyright © 2019 New York University School of Professional Studies. All rights reserved.
//

import UIKit;

protocol HeartRateReceiverDelegate {
    func heartRateUpdated(to bpm: Int);   //beats per minute
}

class HeartRateReceiver {
    var currentHR: Int? {
        didSet {
            if let currentHR = currentHR {
                print("The most recent heart rate reading is \(currentHR).")
            } else {
                print("Looks like we can't pick up a heart rate.")
            }
        }
    }
    
    func startHeartRateMonitoringExample() {
        for _ in 1 ... 10 {
            let randomHR: Int = Int.random(in: 60 ..< 75);
            currentHR = randomHR
            Thread.sleep(forTimeInterval: 2)
        }
    }
}
class ViewController: UIViewController, HeartRateReceiverDelegate {
    var heartRateLabel: UILabel = UILabel();

    override func viewDidLoad() {
        super.viewDidLoad();
        
        // Do any additional setup after loading the view, typically from a nib.
        let heartRateReceiver: HeartRateReceiver = HeartRateReceiver();
        heartRateReceiver.startHeartRateMonitoringExample();
    }
    
    func heartRateUpdated(to bpm: Int) {
        heartRateLabel.text = "\(bpm) bpm";
        print("The user has been shown a heart rate of \(bpm) bpm.");
    }
}

