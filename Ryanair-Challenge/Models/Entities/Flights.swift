//
//  Flights.swift
//  Ryanair-Challenge
//
//  Created by Peter Molnar on 20/08/2020.
//  Copyright © 2020 Peter Molnar. All rights reserved.
//

import Foundation

// Model entity to store the result of the search networking call

// MARK: - Flights
public struct Flights: Codable {
    let termsOfUse: String
    let currency: String
    let currPrecision: Int
    let routeGroup, tripType, upgradeType: String
    let trips: [Trip]
    let serverTimeUTC: String
}

// MARK: - Trip
public struct Trip: Codable {
    let origin, originName, destination, destinationName: String
    let routeGroup, tripType, upgradeType: String
    let dates: [DateElement]
}

// MARK: - DateElement
public struct DateElement: Codable {
    let dateOut: String
    let flights: [Flight]
}

// MARK: - Flight
public struct Flight: Codable {
    let faresLeft: Int
    let flightKey: String
    let infantsLeft: Int
    let operatedBy: String
    let segments: [Segment]
    let flightNumber: String
    let time, timeUTC: [String]
    let duration: String
    let regularFare: RegularFare?
}

// MARK: - RegularFare
public struct RegularFare: Codable {
    let fareKey, fareClass: String
    let fares: [Fare]
}

// MARK: - Fare
public struct Fare: Codable {
    let type: TypeEnum
    let amount: Double
    let count: Int
    let hasDiscount: Bool
    let publishedFare: Double
    let mandatorySeatFee: MandatorySeatFee?
    let discountInPercent: Int
    let hasPromoDiscount: Bool
    let discountAmount: Int
}

// MARK: - MandatorySeatFee
public struct MandatorySeatFee: Codable {
    let vat, amt, total, totalDiscount: Int
    let totalWithoutDiscount: Int
    let discountType, code: String
    let qty: Int
}

public enum TypeEnum: String, Codable {
    case adt = "ADT"
    case chd = "CHD"
    case teen = "TEEN"
}

// MARK: - Segment
public struct Segment: Codable {
    let segmentNr: Int
    let origin, destination, flightNumber: String
    let time, timeUTC: [String]
    let duration: String
}
