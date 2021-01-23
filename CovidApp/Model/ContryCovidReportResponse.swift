//
//  ContryCovidReportResponse.swift
//  CovidApp
//
//  Created by Joan Martin Martrus on 23/01/2021.
//

import Foundation

struct CountryCovidReportResponse: Codable {
    var country: String?
    var provinces: [ProvinceCovidReportResponse]?
}
