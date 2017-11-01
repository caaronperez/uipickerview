//
//  datehelper.swift
//  datepickerview
//
//  Created by MCS Devices on 11/1/17.
//  Copyright © 2017 Mobile Consulting Solutions. All rights reserved.
//

import Foundation

class datehelper {
    
    func date() {
        
        let date = Date()
        let myLocale = Locale(identifier: "bg_BG")
        
        //: ### Setting an application-wide `TimeZone`
        //: Notice how we use if-let in case the abbreviation is wrong. It will fallback to the default timezone in that case.
        if let myTimezone = TimeZone(abbreviation: "DST") {
            print("\(myTimezone.identifier)")
        }
        
        
        //: ### Using a `DateFormatter`
        //: You can set a locale and styles to the date formatter. This allows the dates to be formatted in the given language and provides automatic handling of the preferred date formatting in the locale
        let formatter = DateFormatter()
        formatter.locale = myLocale
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        
        let dateStr = formatter.string(from: date)
        print("1. \(dateStr)")
        
        
        
        var calendar = Calendar(identifier: .gregorian)
        calendar.locale = myLocale
        
        
        //: ### Fetching `DateComponents` off a `Date`
        //: Notice how *a locale is needed for the month symbols to be reported correctly*
        let dateComponents = calendar.dateComponents([.day, .month, .year], from: date)
        let monthName = calendar.monthSymbols[dateComponents.month! - 1]
        print ("2. \(dateComponents.day!) \(monthName) \(dateComponents.year!)")
        
        
        //: #### Constructing a `Date` object from a `DateComponents` object
        //: You need a `DateComponents` object and a `Calendar` object instances to do so
        if let componentsBasedDate = calendar.date(from: dateComponents) {
            let componentsBasedDateStr = formatter.string(from: componentsBasedDate)
            print("3. \(componentsBasedDateStr)")
        }
    }
    
}
