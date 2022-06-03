//
//  DateConvertor.swift
//  To Do List
//
//  Created by Nathaniel Whittington on 6/2/22.
//

import Foundation

//created extension that uses a function to change value type date into a string using formatter.
extension Date {
    func convertToString() -> String {
        return DateFormatter.localizedString(from: self, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.medium)
    }
}

extension NSDate {
    func convertToString() -> String {
        return DateFormatter.localizedString(from: (self as Date), dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.medium)
    }
}
