//
//  String+DateComponentFromString.swift
//  Ryanair-Challenge
//
//  Created by Peter Molnar on 25/08/2020.
//  Copyright © 2020 Peter Molnar. All rights reserved.
//

import Foundation

public extension String {
    
    func responseDateTranslation(locale: Locale = Locale.current) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
                
        guard let date = dateFormatter.date(from: self) else {
            return nil
        }
        dateFormatter.locale =  locale
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .short
        
        let comvertedValue = dateFormatter.string(from: date)
        return comvertedValue
    }
}
