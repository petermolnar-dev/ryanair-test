//
//  String+DateComponentFromString.swift
//  Ryanair-Challenge
//
//  Created by Molnar, Peter, Vodafone Malta on 25/08/2020.
//  Copyright © 2020 Peter Molnar. All rights reserved.
//

import Foundation

public extension String {
    
    func dateComponentFromString() -> DateComponents? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        let calendar = Calendar.current
        
        if let date = dateFormatter.date(from: self) {
            let components = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date)
            return components
        } else {
            dateFormatter.dateFormat = "yyyy-MM-dd"
            if let date = dateFormatter.date(from: self) {
                let components = calendar.dateComponents([.year, .month, .day], from: date)
                return components
            }
            return nil
        }
    }
}
