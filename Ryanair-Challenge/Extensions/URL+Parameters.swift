//
//  URL+Parameters.swift
//  Ryanair-Challenge
//
//  Created by Peter Molnar on 25/08/2020.
//  Copyright © 2020 Peter Molnar. All rights reserved.
//

import Foundation

extension URL {
    public func append(queries: [String: String]) -> URL? {
        guard var urlComponents = URLComponents(url: self, resolvingAgainstBaseURL: true) else {
            return nil
        }
        
        var queryItems: [URLQueryItem] = []
        
        for (key, value) in queries {
            queryItems.append(URLQueryItem(name: key, value: value))
        }
        
        if !queryItems.isEmpty {
            urlComponents.queryItems = queryItems
        }
        
        return urlComponents.url
    }

}
