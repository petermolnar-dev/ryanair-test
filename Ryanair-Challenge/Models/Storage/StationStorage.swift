//
//  StationStorage.swift
//  Ryanair-Challenge
//
//  Created by Peter Molnar on 24/08/2020.
//  Copyright © 2020 Peter Molnar. All rights reserved.
//

import Foundation

public struct StationStorage {
    private let stations: Set<Station>
    
    init(stations: StationsContainer) {
        self.stations = Set(stations.stations)
    }
    
    public func availableStations(for base: String) -> [String] {
        
        guard let baseStation = self.stations.filter({ (station) -> Bool in
            return station.code == base.trimmingCharacters(in: .whitespacesAndNewlines)
        })
        .first else {
            return []
        }
        
        let marketList = baseStation.markets.compactMap { $0.code }
        
        return marketList
    }
    
}
