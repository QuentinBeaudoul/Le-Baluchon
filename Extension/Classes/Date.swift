//
//  Date.swift
//  Extension
//
//  Created by Quentin Beaudoul on 19/02/2022.
//

import Foundation

public extension Date {
    func getFormattedHour() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH':'mm"
        return dateFormatter.string(from: self)
    }
}
