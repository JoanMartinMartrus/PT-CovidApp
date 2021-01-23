//
//  CovidInfo.swift
//  CovidApp
//
//  Created by Joan Martin Martrus on 21/01/2021.
//

import Foundation

enum CovidInfoEndpoint: Endpoint {
    case getCountryList
    case getCountryInfo(countryName: String, date: String)
    
    var scheme: String {
        switch self {
        default:
            return "https"
        }
    }
    
    var baseURL: String {
        switch self {
        default:
            return "www.covid19-api.com"
        }
    }
    
    var path: String {
        switch self {
        case .getCountryList:
            return "/country/all"
        case .getCountryInfo:
            return "/report/country/name"
        }
    }
    
    var parameters: [URLQueryItem] {
        switch self {
        case .getCountryList:
            return [URLQueryItem(name: "format", value: "json")]
        case .getCountryInfo(countryName: let countryName, date: let date):
            return [URLQueryItem(name: "name", value: countryName),
                    URLQueryItem(name: "date", value: date),
                    URLQueryItem(name: "date-format", value: "DD-MM-YYYY"),
                    URLQueryItem(name: "format", value: "json")]
        }
    }
    
    var method: String {
        switch self {
        case .getCountryList:
            return "GET"
        case .getCountryInfo:
            return "GET"
        }
    }
    
    
}
