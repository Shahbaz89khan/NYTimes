//
//  TimePeriod.swift
//  NYTimes
//
//  Created by Shabaz Khan on 11.10.21.
//

enum TimePeriod : String {
    case Day = "1"
    case Week = "7"
    case Month = "30"
    
    static let names = [Day, Week, Month]
    
    var name: String {
        switch self {
        case .Day:
            return "Day"
        case .Week:
            return "Week"
        case .Month:
            return "Month"
        }
    }
    
    init(rawValue: String) {
        switch rawValue {
        case TimePeriod.Day.name:
            self = .Day
        case TimePeriod.Week.name:
            self = .Week
        case TimePeriod.Month.name:
            self = .Month
        default:
            self = .Day
        }
    }
}
