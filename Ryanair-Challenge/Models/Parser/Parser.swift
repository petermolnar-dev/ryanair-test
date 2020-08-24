//
//  Parser.swift
//  Ryanair-Challenge
//
//  Created by Peter Molnar on 21/08/2020.
//  Copyright © 2020 Peter Molnar. All rights reserved.
//

import Foundation

/// Simple parser that can decode any type from `Data` if the type conforms to `Decodable`
public final class Parser {
    
    public func parse<Element: Decodable>(with jsonData: Data, type: Element.Type) -> Any?  {
        if type is Data.Type { return jsonData }
        
        let decoder = JSONDecoder()
        
        do {
            let parsedData = try decoder.decode(Element.self, from: jsonData)
            return parsedData
        } catch  {
            #if DEBUG
            print("⚠️❗️Parsing failed: \(error.localizedDescription)")
            #endif
            return nil
        }

    }
}
