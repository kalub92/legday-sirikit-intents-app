//
//  WorkoutVC.swift
//  LEGDAY
//
//  Created by Caleb Stultz on 10/21/17.
//  Copyright © 2017 Caleb Stultz. All rights reserved.
//

import UIKit
import Intents

class WorkoutVC: UIViewController {

    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var timerLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typeLabel.isHidden = true
        timerLbl.isHidden = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleSiriRequest), name: NSNotification.Name("workoutStartedNotification"), object: nil)
        
        INPreferences.requestSiriAuthorization { (status) in
            if status == INSiriAuthorizationStatus.authorized {
                print("SiriKit: Authorized")
            } else {
                print("SiriKit: Unauthorized")
            }
        }
    }
    
    @objc func handleSiriRequest() {
        guard let intent = DataService.instance.startWorkoutIntent, let goalValue = intent.goalValue, let workoutType = intent.workoutName?.spokenPhrase else {
            timerLbl.isHidden = true
            typeLabel.isHidden = true
            return
        }
        
        typeLabel.isHidden = false
        timerLbl.isHidden = false
        
        typeLabel.text = "TYPE: \(workoutType.capitalized)"
        timerLbl.text = "\(goalValue.convertToClockTime()) LEFT"
    }
}















