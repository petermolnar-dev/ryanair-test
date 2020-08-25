//
//  StationStorageTests.swift
//  Ryanair-ChallengeTests
//
//  Created by Peter Molnar on 24/08/2020.
//  Copyright © 2020 Peter Molnar. All rights reserved.
//

import XCTest
@testable import Ryanair_Challenge


class StationStorageTests: XCTestCase {
    
    func testParsingOneStation() {
        let sut: Station?
        sut = jsonAtPath(pathName: "station")
        
        XCTAssertNotNil(sut)
        XCTAssert(sut?.code == "AAL")
    }
    
    func testPArsingAllStations() {
        let sut: StationsContainer?
        sut = jsonAtPath(pathName: "stations")
        
        XCTAssertNotNil(sut)
        XCTAssert(sut?.stations.count == 320)

    }
    
    func testAvailableStatins() {
        
        let stations: StationsContainer?
        stations = jsonAtPath(pathName: "stations")
        
        guard let stationsForStorage = stations else {
            XCTFail()
            return
        }
        
        let sut = StationStorage(stations: stationsForStorage)
        let markets = sut.availableStations(for: "AAR")
        XCTAssert(markets.count == 4)
    }
    
    // Helper
    func jsonAtPath<Parsable: Decodable>(pathName: String) -> Parsable? {
        let bundle = Bundle(for: type(of: self))
        if let path = bundle.path(forResource: pathName, ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                if let parsedModel = Parser().parse(with: data, type: Parsable.self) {
                    return parsedModel as? Parsable
                }
            } catch {
                return nil
            }
        }
        return nil
    }

}
