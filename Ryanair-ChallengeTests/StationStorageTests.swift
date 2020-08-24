//
//  StationStorageTests.swift
//  Ryanair-ChallengeTests
//
//  Created by Peter Molnar on 24/08/2020.
//  Copyright © 2020 Peter Molnar. All rights reserved.
//

import XCTest
@testable import Ryanair_Challenge

public struct StationStorage {
    private let stations: Stations
    
    init(stations: Stations) {
        self.stations = stations
    }
    
    public func availableStations(for base: String) -> [String] {
        return []
    }
    
}

class StationStorageTests: XCTestCase {
    func testAvailabeStations() {
//        let stations = Stations()
//        let sut = StationStorage(stations: stations)
//        
//        XCTAssert(<#T##expression: Bool##Bool#>, <#T##message: String##String#>)

    }


}
