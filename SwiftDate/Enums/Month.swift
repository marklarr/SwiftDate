import Foundation

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