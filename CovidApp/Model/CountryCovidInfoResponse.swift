//
//  CountryCovidInfo.swift
//  CovidApp
//
//  Created by Joan Martin Martrus on 21/01/2021.
//

import Foundation

struct CountryCovidInfoResponse: Codable {
    var country: String?
    var code: String?
    var confirmed: Int?
    var recovered: Int?
    var critical: Int?
    var deaths: Int?
    var latitude: Double?
    var longitude: Double?
    var lastChange: String?
    var lastUpdate: String?
}

