//
//  Stations.swift
//  Ryanair-Challenge
//
//  Created by Peter Molnar on 20/08/2020.
//  Copyright © 2020 Peter Molnar. All rights reserved.
//

import Foundation

// Model entity to store the station list resut from the network query

// MARK: - Stations
struct StationsContainer: Codable {
    let stations: [Station]
}

// MARK: - Station
struct Station: Codable {
    let code, name: String
    let alternateName: String?
    let alias: [String]
    let countryCode, countryName: String
    let countryAlias: JSONNull?
    let countryGroupCode: String
    let countryGroupName: CountryGroupName
    let timeZoneCode, latitude, longitude: String
    let mobileBoardingPass: Bool
    let markets: [Market]
    let notices: JSONNull?
    let tripCardImageURL: String?
    let ecoFriendly, airportShopping: Bool?
    
    enum CodingKeys: String, CodingKey {
        case code, name, alternateName, alias, countryCode, countryName, countryAlias, countryGroupCode, countryGroupName, timeZoneCode, latitude, longitude, mobileBoardingPass, markets, notices
        case tripCardImageURL = "tripCardImageUrl"
        case ecoFriendly, airportShopping
    }
}

enum CountryGroupName: String, Codable {
    case euEea = "EU/EEA"
    case nonEUEEA = "non EU/EEA"
}

// MARK: - Market
struct Market: Codable {
    let code: String
    let group: Group?
    let stops: [Stop]?
    let onlyConnecting, pendingApproval, onlyPrintedBoardingPass: Bool?
}

enum Group: String, Codable {
    case canary = "CANARY"
    case canaryGold = "CANARY_GOLD"
    case city = "CITY"
    case cityGold = "CITY_GOLD"
    case domestic = "DOMESTIC"
    case domesticGold = "DOMESTIC_GOLD"
    case ethnic = "ETHNIC"
    case leisure = "LEISURE"
    case leisureGold = "LEISURE_GOLD"
    case ukp = "UKP"
    case ukpGold = "UKP_GOLD"
}

// MARK: - Stop
struct Stop: Codable {
    let code: Code
}

enum Code: String, Codable {
    case bgy = "BGY"
    case dus = "DUS"
    case fco = "FCO"
    case opo = "OPO"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

extension Station: Hashable {
    
    // Conforming to HAshable protocol
    func hash(into hasher: inout Hasher) {
        hasher.combine(code)
    }
    
    // Conforming to Equitable protocol
    static func == (lhs: Station, rhs: Station) -> Bool {
        lhs.code == rhs.code
    }
}
