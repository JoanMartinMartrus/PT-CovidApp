//
//  CovidInfo.swift
//  CovidApp
//
//  Created by Joan Martin Martrus on 21/01/2021.
//

import Foundation

enum CovidInfoEndpoint: Endpoint {
    case getCountryList
    
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
        }
    }
    
    var parameters: [URLQueryItem] {
        return [URLQueryItem(name: "format", value: "json")]
    }
    
    var method: String {
        switch self {
        case .getCountryList:
            return "GET"
        }
    }
    
    
}
