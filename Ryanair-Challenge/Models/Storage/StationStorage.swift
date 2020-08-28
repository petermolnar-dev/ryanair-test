//
//  StationStorage.swift
//  Ryanair-Challenge
//
//  Created by Peter Molnar on 24/08/2020.
//  Copyright © 2020 Peter Molnar. All rights reserved.
//

import Foundation

public final class StationStorage {
    private var stations = [Station]()
    private let networkManager = NetworkManager()
    
    public func availableStations(for base: String) -> [Station] {
        
        guard let baseStation = self.stations.filter({ (station) -> Bool in
            return station.code == base.trimmingCharacters(in: .whitespacesAndNewlines)
        })
        .first else {
            return []
        }
        
        let marketList = Set(baseStation.markets.compactMap { $0.code })
        let availableStations = stations.filter { (station) -> Bool in
            return marketList.contains(station.code)
        }
        
        return availableStations
    }
    
    public func stationList() -> [String] {
        return self.stations.compactMap { $0.code }.sorted()
    }
    
    public func station(at index: Int) -> Station {
        return stations[index]
    }
    
    public func fetchStationList(from URLString: String, completion: @escaping () -> Void) {
        if let url = URL(string: URLString) {
            self.networkManager.loadData(with: url, parserType: StationsContainer.self) { result in
                switch result {
                case.success(let stationCantainer):
                    self.stations = stationCantainer.stations
                case .failure(let error):
                    print("Error during the statin list fetching: \(error)")
                }
                completion()
            }
        }
        
    }
    
}
