//
//  CalendarHelper.swift
//  CalendarExampleTutorial
//
//  Created by Вадим Гамзаев on 16.08.2022.
//

import UIKit

class CalendarHelper {
    
    let calender = Calendar.current
    
    // увеличивает дату на месяц
    func plusMonth(date: Date) -> Date {
        return calender.date(byAdding: .month, value: 1, to: date)!
    }

    // уменьшают дату на месяц
    func minusMonth(date: Date) -> Date {
        return calender.date(byAdding: .month, value: -1, to: date)!
    }
    
    // возвращаем название месяца строкой
    func monthString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        return dateFormatter.string(from: date)
    }
    
    // возвращаемп год строкой
    func yearString(date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy"
        return dateFormatter.string(from: date)
    }
    
    // возвращаем количкество дней в месяце
    func daysInMonth(date: Date) -> Int {
        let range = calender.range(of: .day, in: .month, for: date)!
        return range.count
    }
    
    // возвращаем день месяца
    func dayOfMonth(date: Date) -> Int {
        let components = calender.dateComponents([.day], from: date)
        return components.day!
    }
    
    // возвращаем первый день месяца
    func firstOfMonth(date: Date) -> Date {
        let components = calender.dateComponents([.year, .month], from: date)
        return calender.date(from: components)!
    }
    
    // возвращаем день недели
    func weekDay(date: Date) -> Int {
        let components = calender.dateComponents([.weekday], from: date)
        return components.weekday! - 2
    }
}
