//
//  Date+Extension.swift
//  NewsApp
//
//  Created by Shivansh Gaur on 21/09/21.
//

import Foundation

extension Date {
    static func returnPreviousDate() -> String {
        let previousDate = Calendar.current.date(byAdding: .day, value: -1 ,to: Date())!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: previousDate)
    }

    static func returnCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: Date())
    }

    static func redableDateFormat(urlDate: String?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let receivedDate = dateFormatter.date(from: urlDate ?? "1999-01-01T01:00:00Z")
        let currentDateFormat = DateFormatter()
        currentDateFormat.dateFormat = "dd-MM-yyyy hh:mm a"
        return currentDateFormat.string(from: receivedDate!)
    }
}
