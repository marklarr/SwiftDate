import Foundation



extension NSTimeInterval {
    
    var seconds: NSTimeInterval {
        return self
    }
    // TODO: Are aliases possible?
    var second: NSTimeInterval { return self.seconds }
    
    var minutes: NSTimeInterval {
        return self * 60
    }
    var minute: NSTimeInterval { return self.minutes }
    
    var hours: NSTimeInterval {
        return self.minutes * 60
    }
    var hour: NSTimeInterval { return self.hours }
    
    var days: NSTimeInterval {
        return self.hours * 24
    }
    var day: NSTimeInterval { return self.days }
    
    var months: NSTimeInterval {
        return self.days * 31
    }
    var month: NSTimeInterval { return self.months }

    
    var years: NSTimeInterval {
        return self.months * 12
    }
    var year: NSTimeInterval { return self.years }
    
    var ago: NSDate {
        return NSDate(timeIntervalSinceNow: -self)
    }
    
    var fromNow: NSDate {
        return NSDate(timeIntervalSinceNow: self)
    }
    
}

enum Month: Int {
    case Jan = 1, Feb, Mar, Apr, May, June, July, Aug, Sept, Oct, Nov, Dec
}

let (Jan, January) = (Month.Jan, Month.Jan)
let (Feb, February) = (Month.Feb, Month.Feb)
let (Mar, March) = (Month.Mar, Month.Mar)
let (Apr, April) = (Month.Apr, Month.Apr)
let May = Month.May
let June = Month.June
let July = Month.July
let (Aug, August) = (Month.Aug, Month.Aug)
let (Sept, September) = (Month.Sept, Month.Sept)
let (Oct, October) = (Month.Oct, Month.Oct)
let (Nov, November) = (Month.Nov, Month.Nov)
let (Dec, December) = (Month.Dec, Month.Dec)



@infix func / (month: Month, right: Int) -> NSDate {
    let gregorian = NSCalendar(calendarIdentifier: NSGregorianCalendar)
    let dc = gregorian.components(NSCalendarUnit.YearCalendarUnit | NSCalendarUnit.MonthCalendarUnit | NSCalendarUnit.DayCalendarUnit, fromDate: NSDate())
    var currentYearString = String(dc.year)
    dc.month = month.toRaw()

    switch String(right).utf16count {
    case 1, 2:
        dc.day = right
    default:
        dc.day = 1
        dc.year = right
    }
    return NSCalendar.currentCalendar().dateFromComponents(dc)
}

@infix func / (date: NSDate, right: Int) -> NSDate {
    let gregorian = NSCalendar(calendarIdentifier: NSGregorianCalendar)
    let dc = gregorian.components(NSCalendarUnit.YearCalendarUnit | NSCalendarUnit.MonthCalendarUnit | NSCalendarUnit.DayCalendarUnit, fromDate: date)
    dc.year = right
    return NSCalendar.currentCalendar().dateFromComponents(dc)
}

@infix func > (dateA: NSDate, dateB: NSDate) -> Bool {
    return dateA.compare(dateB) == NSComparisonResult.OrderedDescending
}

@infix func < (dateA: NSDate, dateB: NSDate) -> Bool {
    return dateA.compare(dateB) == NSComparisonResult.OrderedAscending
}

@infix func >= (dateA: NSDate, dateB: NSDate) -> Bool {
    return dateA == dateB || dateA > dateB
}

@infix func <= (dateA: NSDate, dateB: NSDate) -> Bool {
    return dateA == dateB || dateA < dateB
}
