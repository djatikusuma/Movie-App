//
//  DateUtils.swift
//  Movie App
//
//  Created by Rangga Djatikusuma Lukman on 16/04/20.
//  Copyright © 2020 Lukman Solution. All rights reserved.
//

import Foundation

class DateUtils: NSObject {
    static func humanDate(_ date: String) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        let tgl = dateFormatter.date(from: date)!
        
        dateFormatter.locale = Locale(identifier: "in_ID")
        dateFormatter.dateFormat = "dd MMMM yyyy"
        
        return dateFormatter.string(from: tgl)
    }
}
