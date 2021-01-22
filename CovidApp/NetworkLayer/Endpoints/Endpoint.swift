//
//  Endpoint.swift
//  CovidApp
//
//  Created by Joan Martin Martrus on 21/01/2021.
//

import Foundation

protocol Endpoint {
    
    var scheme: String { get }
    
    var baseURL: String { get }

    var path: String { get }

    var parameters: [URLQueryItem] { get }
    
    var method: String { get }
    
}
