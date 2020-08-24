//
//  NetworkService.swift
//  Ryanair-Challenge
//
//  Created by Peter Molnar on 24/08/2020.
//  Copyright © 2020 Peter Molnar. All rights reserved.
//

import Foundation

public typealias NetworkRequestHandler = (_ data: Data?, _ response: HTTPURLResponse?, _ error: NSError? ) -> Void

public protocol NetworkServiceProtocol {
    func networkRequest(request: URLRequest, completionHandler: @escaping NetworkRequestHandler)
}

public final class NetworkService: NSObject, NetworkServiceProtocol {
    private var sessionConfiguration: URLSessionConfiguration
    private var session: URLSession
    
    // MARK: Initialisers
    public convenience override init() {
        let sessionConfig = URLSessionConfiguration.default
        sessionConfig.timeoutIntervalForRequest = 20.0
        self.init(sessionConfig: sessionConfig)
    }
    
    public init(sessionConfig: URLSessionConfiguration) {
        self.sessionConfiguration = sessionConfig
        self.session = URLSession(configuration: self.sessionConfiguration)
    }
    
    
    //MARK: Conforming to NetworkServiceProtocol protocol
    public func networkRequest(request: URLRequest, completionHandler: @escaping NetworkRequestHandler) {
        let task =  session.dataTask(with: request) {
            (data, response, error) in
            guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                if let error = error as NSError?, error.domain == NSURLErrorDomain {
                    completionHandler(nil, nil, error)
                }
                return
            }
            completionHandler(data, response, nil)
            
        }
        
        task.resume()
    }
}
