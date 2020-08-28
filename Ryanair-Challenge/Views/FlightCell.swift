//
//  FlightCell.swift
//  Ryanair-Challenge
//
//  Created by Molnar, Peter, Vodafone Malta on 26/08/2020.
//  Copyright © 2020 Peter Molnar. All rights reserved.
//

import UIKit

public final class FlightCell: UITableViewCell {

    @IBOutlet var outDate: UILabel!
    @IBOutlet var flightNumber: UILabel!
    @IBOutlet var regularFareSummed: UILabel!
    
    static let cellIdentifier = "FlightCell"
    
    public func configure(with flight: Flight, currency: String, currPrecision: Int) {
        self.outDate?.text = flight.time[0].dateTranslationTo()
        self.flightNumber?.text = flight.flightNumber
        self.regularFareSummed?.text = String(format: "%.\(currPrecision)f", flight.regularFare?.fares[0].amount ?? "N/A") + " " + currency
    }
}
