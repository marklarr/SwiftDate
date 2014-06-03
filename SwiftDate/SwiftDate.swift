import Foundation



extension NSTimeInterval {
    
    var seconds: NSTimeInterval {
        return self
    }
    
    var minutes: NSTimeInterval {
        return self * 60
    }
    
    var hours: NSTimeInterval {
        return self.minutes * 60
    }
    
    var days: NSTimeInterval {
        return self.hours * 24
    }
    
    var months: NSTimeInterval {
        return self.days * 31
    }
    
    var years: NSTimeInterval {
        return self.months * 12
    }
    
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
    
    let dateFormatter = NSDateFormatter()
    dateFormatter.dateFormat  = "MM/dd/yyyy"
    var dateStr: NSString
    if String(right).utf16count == 4 {
        dateStr = "\(month.toRaw())/1/\(right)"
    } else {
        let gregorian = NSCalendar(calendarIdentifier: NSGregorianCalendar)
        let dc = gregorian.components(NSCalendarUnit.YearCalendarUnit, fromDate: NSDate())
        dateStr = "\(month.toRaw())/\(right)/\(dc.year)"
    }
    return dateFormatter.dateFromString(dateStr)
}

@infix func / (date: NSDate, right: Int) -> NSDate {
    let gregorian = NSCalendar(calendarIdentifier: NSGregorianCalendar)
    let dc = gregorian.components(NSCalendarUnit.YearCalendarUnit | NSCalendarUnit.MonthCalendarUnit | NSCalendarUnit.DayCalendarUnit, fromDate: date)
    println(dc.month)
    println(dc.day)
    if String(right).utf16count == 4 || true {
        dc.year = right
    }
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
