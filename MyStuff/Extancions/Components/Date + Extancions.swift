//
//  Date + Extancions.swift
//  MyStuff
//
//  Created by apple on 2/19/24.
//

import Foundation

extension Date {
    
    func getWeekdayNumber() -> Int {
        let calendar =  Calendar.current
        let weekday = calendar.component(.weekday, from: self)
        return weekday
    }
    
    func localDate() -> Date {
        let timeZoneOffset = TimeZone.current.secondsFromGMT(for: self)
        let localDate = Calendar.current.date(byAdding: .second, value: timeZoneOffset, to: self) ?? Date()
        return localDate
    }
    
    func getWeekArray() -> [[String]] {
        let formater = DateFormatter()
        formater.locale = Locale(identifier: "en_GB")
        formater.dateFormat = "EEEEEE"
        let calendar = Calendar.current
        
        var weekArray: [[String]] = [[], []]
        
        for index in -6...0 {
            let date = calendar.date(byAdding: .day, value: index, to: self) ?? Date()
            let day = calendar.component(.day, from: date)
            weekArray[1].append("\(day)")
            let weekDay = formater.string(from: date)
            weekArray[0].append(weekDay)
        }
        return weekArray
    }
    
    func offSetDay(days: Int) -> Date {
        Calendar.current.date(byAdding: .day, value: -days, to: self) ?? Date()
    }
    
    func offSetMonth(month: Int) -> Date {
        Calendar.current.date(byAdding: .month, value: -month, to: self) ?? Date()
    }
    
    func startEndDate() -> (start: Date, end: Date) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let calendar = Calendar.current
        
        let stringDate = formatter.string(from: self)
        let totalDate = formatter.date(from: stringDate) ?? Date()
        
        let local = totalDate.localDate()
        let dateEnd: Date = {
            let companents = DateComponents(day: 1)
            return calendar.date(byAdding: companents, to: local) ?? Date()
        }()
        
        return (local, dateEnd)
        
    }
}

