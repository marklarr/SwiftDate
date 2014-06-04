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