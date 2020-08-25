//
//  ResultsViewController.swift
//  Ryanair-Challenge
//
//  Created by Molnar, Peter, Vodafone Malta on 25/08/2020.
//  Copyright © 2020 Peter Molnar. All rights reserved.
//

import Foundation
import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet var resultsTableView: UITableView!
    public var queryParameters = [String : String]()
    let networkManager = NetworkManager()
    
    private let loadingIndicator = UIActivityIndicatorView()
    
    override func viewDidLoad() {
        
        
        if let url = URL(string: searchURLAsString),
            let queryUrl = url.append(queries: self.queryParameters) {
            self.showActivityIndicator()
            networkManager.loadData(with: queryUrl, parserType: Flights.self) { [weak self] (result) in
                self?.hideActivityIndicator()
                switch result {
                case .success(let data):
                    // TODO: Process the data and display it on the tableview
                    // TODO: Show a view when the data is empty
                    print(data)
                    
                case .failure(let error):
                    print("Error happened: \(error)")
                }
            }
        }
        
    }
    
    // MARK: Helpers
    private func showActivityIndicator() {
        DispatchQueue.main.async {
            self.resultsTableView.isHidden = true
            self.loadingIndicator.startAnimating();
            self.view.addSubview(self.loadingIndicator)
        }
        
    }
    
    private func hideActivityIndicator() {
        DispatchQueue.main.async {
            self.loadingIndicator.removeFromSuperview()
            self.resultsTableView.isHidden = false
        }
        
    }
}
