//
//  ProvinceCovidReportResponse.swift
//  CovidApp
//
//  Created by Joan Martin Martrus on 23/01/2021.
//

import Foundation

struct ProvinceCovidReportResponse: Codable {
    var province: String?
    var confirmed: Int?
    var recovered: Int?
    var deaths: Int?
    var active: Int?
    var latitude: Double?
    var longitude: Double?
    var date: String?
}
