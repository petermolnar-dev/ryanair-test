//
//  ResultsViewController+TableView.swift
//  Ryanair-Challenge
//
//  Created by Molnar, Peter, Vodafone Malta on 26/08/2020.
//  Copyright © 2020 Peter Molnar. All rights reserved.
//

import UIKit

extension ResultsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let flightCount = self.flights?.trips.first?.dates.first?.flights.count else {
            return 0
        }
        return flightCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: FlightCell.cellIdentifier, for: indexPath) as? FlightCell else {
                   fatalError("Couldn't deque cell!")
               }
               
        if let flight = self.flights?.trips.first?.dates.first?.flights[indexPath.row],
            let currency = self.flights?.currency,
            let currPrecision = flights?.currPrecision {
            cell.configure(with: flight, currency: currency, currPrecision: currPrecision)

        }
               return cell
    }
    
    
}
