//
//  SwiftDateTests.swift
//  SwiftDateTests
//
//  Created by Mark Larsen on 6/3/14.
//  Copyright (c) 2014 marklarr. All rights reserved.
//

import XCTest
import SwiftDate

class SwiftDateTests: XCTestCase {
    
    func testNSTimeIntervalUnitConversions() {
        XCTAssertEqual(2.minutes, 120.seconds)
        XCTAssertEqual(2.hours, (60 * 60 * 2))
        XCTAssertEqual(3.days, (60 * 60 * 24 * 3))
        XCTAssertEqual(3.months, (60 * 60 * 24 * 31 * 3))
        XCTAssertEqual(4.years, (60 * 60 * 24 * 31 * 12 * 4))
    }
    
    func testNSDateGreaterThan() {
        XCTAssertTrue(2.seconds.ago > 2.days.ago)
        XCTAssertTrue(2.months.ago > 1.years.ago)
    }
    
    func testNSDateLessThan() {
        XCTAssertTrue(2.days.ago < 150.minutes.ago)
        XCTAssertTrue(3.years.ago < 5.years.fromNow)
        XCTAssertTrue(1.years.ago < (-5).years.ago)
    }
    
    func testNSDateGreaterThanOrEqualTo() {
        XCTAssertTrue(2.seconds.ago >= 2.days.ago)
        var date = 2.days.ago
        XCTAssertTrue(date >= date)
        XCTAssertFalse(2.days.ago >= 2.days.fromNow)
    }
    
    func testNSDateLessThanOrEqualTo() {
        XCTAssertTrue(2.days.ago <= 150.minutes.ago)
        var date = 2.days.ago
        XCTAssertTrue(date <= date)
        XCTAssertFalse(2.days.fromNow <= 2.days.ago)
    }
    
    func testInlineDates() {
        let gregorian = NSCalendar(calendarIdentifier: NSGregorianCalendar)
        let dc = gregorian.components(NSCalendarUnit.YearCalendarUnit, fromDate: NSDate())
        var currentYearString = String(dc.year)
        let formatter = NSDateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        
        XCTAssertEqualObjects(formatter.stringFromDate(Mar/5/2013), "03/05/2013")
        XCTAssertEqualObjects(Mar/5/2013, March/5/2013)
        XCTAssertEqualObjects(formatter.stringFromDate(June/2014), "06/01/2014")
        XCTAssertEqualObjects(formatter.stringFromDate(June/2), "06/02/" + currentYearString)
        
        XCTAssertEqualObjects(formatter.stringFromDate(November/5/1605), "11/05/1605")

    }
    
}
