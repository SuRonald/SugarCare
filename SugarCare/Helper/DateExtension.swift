//
//  DateExtension.swift
//  SugarCare
//
//  Created by Ronald Sumichael Sunan on 24/05/23.
//

import Foundation

extension Date {
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }

    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: self)!
    }
}
