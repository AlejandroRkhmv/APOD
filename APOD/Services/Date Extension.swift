//
//  Date Extension.swift
//  APOD
//
//  Created by Александр Рахимов on 11.02.2023.
//

import Foundation

extension Date {
    
    func isBetween(startDate: Date, endDate: Date) -> Bool {
        if startDate.timeIntervalSince1970 <= self.timeIntervalSince1970 && self.timeIntervalSince1970 <= endDate.timeIntervalSince1970 {
            return true
        }
        return false
    }
}
