import Foundation

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
