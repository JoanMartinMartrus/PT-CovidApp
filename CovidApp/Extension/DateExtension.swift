//
//  DateExtension.swift
//  CovidApp
//
//  Created by Joan Martin Martrus on 24/01/2021.
//

import Foundation

extension Date {
    var dateFormatterDefault: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd-MM-yyy"
        return dateFormatter
    }
    
    func toString(withFormatter formatter: DateFormatter?) -> String {
        if let dateFormatter = formatter {
            return dateFormatter.string(from: self)
        } else {
            return dateFormatterDefault.string(from: self)
        }
    }
}
