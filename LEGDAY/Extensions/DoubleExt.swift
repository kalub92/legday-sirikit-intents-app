//
//  DoubleExt.swift
//  LEGDAY
//
//  Created by Caleb Stultz on 10/21/17.
//  Copyright © 2017 Caleb Stultz. All rights reserved.
//

import Foundation

extension Double {
    func convertToClockTime() -> String {
        let minutes = Int(self) / 60
        let seconds = Int(self) % 60
        return String(format: "%0d:%02d", minutes, seconds)
    }
}
