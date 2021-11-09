

import Foundation

extension Calendar {
    static func calendarByCurrentTimezone() -> Calendar {
        var calendar = Calendar(identifier: .gregorian)
        let timeZoneBias = 480 // (UTC+08:00)
        let timeZone = TimeZone(secondsFromGMT: -timeZoneBias * 60)
        if let timeZone = timeZone {
            calendar.timeZone = timeZone as TimeZone
        }
        return calendar
    }
}

extension Date {
    
    /// Date to String
    ///
    /// - Parameter formatter: Date formatter. Default is "MMM dd, yyyy"
    /// - Returns: A String
    func string(formatter: String = "MMM dd, yyyy",_ usingCurrentSystem: Bool = false) -> String {
        let dateFormatterGet = DateFormatter()
        
        if usingCurrentSystem {
            let enUSPOSIXLocale = Locale(identifier:"en_US_POSIX")
            dateFormatterGet.locale = enUSPOSIXLocale
            dateFormatterGet.timeZone = TimeZone.current
        }
        
        dateFormatterGet.dateFormat = formatter
        return dateFormatterGet.string(from: self)
    }
    
    /// Date to String by ISO 8601 format
    ///
    /// - Returns: String
    func stringISO8601Format() -> String {
        return string(formatter: "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ")
    }

    init(string: String,
         format: String = "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ",
         fallbackFormat: String = "yyyy-MM-dd'T'HH:mm:ssZ",
         usingCurrentSystem: Bool = false) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        
        if usingCurrentSystem {
            let enUSPOSIXLocale = Locale(identifier:"en_US_POSIX")
            dateFormatter.locale = enUSPOSIXLocale
            dateFormatter.timeZone = TimeZone.current
        }
        
        if let date = dateFormatter.date(from: string) {
            self = date
            return
        }
        
        dateFormatter.dateFormat = fallbackFormat
        self = dateFormatter.date(from: string) ?? Date()
    }
    
//    func isComparedWithDay(_ compareDate: Date) -> CompareDateType{
//        let mineComponents = NSCalendar.current.dateComponents([.day, .month, .year], from: self)
//        let otherComponents = NSCalendar.current.dateComponents([.day, .month, .year], from: compareDate)
//  
//        let mineYear = mineComponents.year ?? 0
//        let otherYear = otherComponents.year ?? 0
//        
//        if(mineYear == otherYear) {
//            let mineMonth = mineComponents.month ?? 0
//            let otherMonth = otherComponents.month ?? 0
//            
//            if(mineMonth == otherMonth) {
//                let mineDay = mineComponents.day ?? 0
//                let otherDay = otherComponents.day ?? 0
//                
//                if(mineDay == otherDay) {
//                    return .DATE_IS_TODAY
//                    
//                } else {
//                    return ((mineDay > otherDay) ? .DATE_IS_FUTURE : .DATE_IS_PAST)
//                }
//                
//            } else {
//                return ((mineMonth > otherMonth) ? .DATE_IS_FUTURE : .DATE_IS_PAST)
//            }
//            
//        } else {
//            return ((mineYear > otherYear) ? .DATE_IS_FUTURE : .DATE_IS_PAST)
//        }
//    }
//    
//    public func isSameWith(_ date: Date?) -> Bool {
//        let delta = Double(abs(Float(timeIntervalSince1970 - (date?.timeIntervalSince1970 ?? 0.0))))
//        return delta <= kMilisecondsPerDay
//    }
    
    func roundDateThirtyInerval() -> Date {
        var mineComponents = NSCalendar.current.dateComponents([.day, .month, .year, .hour, .minute, .second], from: self)
        var minutes = mineComponents.minute ?? 0
        let minuteUnit : Float = ceil( Float(minutes) / 30.0)
        minutes = Int(minuteUnit * 30.0)
        mineComponents.setValue(minutes, for: .minute)
        return NSCalendar.current.date(from: mineComponents) ?? Date.today
    }
    
    static func combineDate(date: Date, withTime: Date) -> Date{
        let gregorian = NSCalendar(calendarIdentifier: .gregorian)
        var dateComponents = gregorian?.components([.year, .month, .day], from: date)
        let timeComponents = gregorian?.components([.hour, .minute, .second], from: withTime)
        dateComponents?.setValue(timeComponents?.second, for: .second)
        dateComponents?.setValue(timeComponents?.minute, for: .minute)
        dateComponents?.setValue(timeComponents?.hour, for: .hour)
        return gregorian?.date(from: dateComponents ?? DateComponents()) ?? Date.today
    }
    
    static var today: Date{
        return Date()
    }
    
    public func getDefaultTimezoneOffset() -> String? {
        let dateFormatter = DateFormatter()
        let enUSPOSIXLocale = Locale(identifier: "en_US_POSIX")
        dateFormatter.locale = enUSPOSIXLocale as Locale

        dateFormatter.dateFormat = "ZZZZZ"
        return dateFormatter.string(from: self)
    }

     public func getDefaultTimezoneDisplay() -> String? {
        let dateFormatter = DateFormatter()
        let enUSPOSIXLocale = Locale(identifier: "en_GB")
        dateFormatter.locale = enUSPOSIXLocale as Locale
        dateFormatter.dateFormat = "zzzzz"
        return dateFormatter.string(from: self)
    }

    public func getDefaultTimezoneName() -> String? {
        return Calendar.current.timeZone.localizedName(for: .daylightSaving, locale: Locale(identifier: "en_GB"))
    }
    
    public func inSameDay(as aDate: Date?) -> Bool {
        if let aDate = aDate {
            return Calendar.current.isDate(self, inSameDayAs: aDate)
        }
        return false
    }
    
    public func isFutureOf(_ date: Date?) -> Bool {
        guard let currentDate = date else {
            return true
        }

        let result = compare(currentDate)
        return result == .orderedDescending
    }
    
    public func isPastOf(_ date: Date?) -> Bool {
        guard let currentDate = date else {
            return true
        }

        let result = compare(currentDate)
        return result == .orderedAscending
    }
    
    public func isSameOf(_ date: Date?) -> Bool {
        guard let currentDate = date else {
            return true
        }

        let result = compare(currentDate)
        return result == .orderedSame
    }
    
    public func displayDateWithFormat(_ format: String) -> String{
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.amSymbol = "am"
        formatter.pmSymbol = "pm"
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
    
    public func displayUppercaseSymbolDateWithFormat(_ format: String) -> String{
        let formatter = DateFormatter()
        formatter.timeZone = TimeZone.current
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.amSymbol = " AM"
        formatter.pmSymbol = " PM"
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}

extension Date {
    var millisecondsSince1970:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }

    init(milliseconds:Int64) {
        self = Date(timeIntervalSince1970: TimeInterval(milliseconds) / 1000)
    }
}

// MARK: - Time between two Date
extension Date {
    
    func years(sinceDate: Date) -> Int? {
        return Calendar.current.dateComponents([.year], from: sinceDate, to: self).year
    }
    
    func months(sinceDate: Date) -> Int? {
        return Calendar.current.dateComponents([.month], from: sinceDate, to: self).month
    }
    
    func days(sinceDate: Date) -> Int? {
        return Calendar.current.dateComponents([.day], from: sinceDate, to: self).day
    }
    
    func hours(sinceDate: Date) -> Int? {
        return Calendar.current.dateComponents([.hour], from: sinceDate, to: self).hour
    }
    
    func minutes(sinceDate: Date) -> Int? {
        return Calendar.current.dateComponents([.minute], from: sinceDate, to: self).minute
    }
    
    func seconds(sinceDate: Date) -> Int? {
        return Calendar.current.dateComponents([.second], from: sinceDate, to: self).second
    }
    
}


