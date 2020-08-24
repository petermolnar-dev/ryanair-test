//
//  NetworkManager.swift
//  Ryanair-Challenge
//
//  Created by Peter Molnar on 24/08/2020.
//  Copyright © 2020 Peter Molnar. All rights reserved.
//

import Foundation

enum NetworkingError: Error {
    case parsing
    case resultIssue
}

public protocol NetworkManagerProtocol {
    func loadData<Parseable: Decodable>(with url: URL, parserType: Parseable.Type, completion: @escaping (Result<Parseable, Error>) -> Void)
}

public final class NetworkManager: NetworkManagerProtocol {
    
    private var networkService: NetworkServiceProtocol
    private var responseParser = Parser()
    
    // MARK: Initalizers. NetworkService is optional.
    required init(_ networkService: NetworkServiceProtocol = NetworkService()) {
        self.networkService = networkService
    }
    
    // MARK: Conforming to NetworkManagerProtocol protocol
    public func loadData<Parseable>(with url: URL, parserType: Parseable.Type, completion: @escaping (Result<Parseable, Error>) -> Void) where Parseable : Decodable  {
        
        let request = URLRequest(url: url)
        networkService.networkRequest(request: request) { [weak self] (result, response, error) in
            guard let downloadedData = result else {
                completion(.failure(NetworkingError.resultIssue))
                return
            }
            guard let parsedData = self?.responseParser.parse(with: downloadedData, type: Parseable.self) as? Parseable else {
                completion(.failure(NetworkingError.parsing))
                return
            }
            
            completion(.success(parsedData))
        }
    }
    
}
