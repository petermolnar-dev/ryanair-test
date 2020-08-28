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
    
    private let networkManager = NetworkManager()
    private let loadingIndicator = UIActivityIndicatorView()
    internal var flights: Flights?
    
    
    // MARK: ViewController Lifecycle
    override func viewDidLoad() {
        setupUI()
        if let url = URL(string: searchURLAsString),
            let queryUrl = url.append(queries: self.queryParameters) {
            self.showActivityIndicator()
            networkManager.loadData(with: queryUrl, parserType: Flights.self) { [weak self] (result) in
                self?.hideActivityIndicator()
                switch result {
                case .success(let data):
                    self?.flights = data
                    DispatchQueue.main.async {
                        self?.resultsTableView.reloadData()
                    }
                    
                case .failure(let error):
                    print("Error happened: \(error)")
                }
            }
        }
        
    }
    
    // MARK setting up the UI
    private func setupUI() {
        self.resultsTableView.rowHeight = 120;
        self.resultsTableView.dataSource = self
        self.loadingIndicator.centeredLoading(for: self.view)
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
