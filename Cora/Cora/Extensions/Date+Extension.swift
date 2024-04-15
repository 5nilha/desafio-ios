//
//  Date+Extension.swift
//  Cora
//
//  Created by Fabio Quintanilha on 11/04/24.
//

import Foundation

extension Date {

    enum FormatType {
        case hoursAndMinutes
        case weekDay_day_month
        case weekDay_day_month_year

        var dateFormat: String {
            switch self {
            case .hoursAndMinutes: return "HH:mm"
            case .weekDay_day_month_year: return "dd/MM/yyyy"
            case .weekDay_day_month: return "dd 'de' MMMM"
            }
        }
    }

    func formatToHoursAndMinutes() -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "HH:mm"
        let timeString = timeFormatter.string(from: self)
        return timeString
    }

    func formatRelativeDate(formatType: FormatType) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "pt_BR")

        dateFormatter.dateFormat = formatType.dateFormat
        let dateformat = dateFormatter.string(from: self)

        if formatType == .weekDay_day_month || formatType == .weekDay_day_month_year {
            let calendar = Calendar.current
            if calendar.isDateInToday(self) {
                return "Hoje - \(dateformat)"
            } else if calendar.isDateInTomorrow(self) {
                return "Amanhã - \(dateformat)"
            } else if calendar.isDateInYesterday(self) {
                return "Ontem - \(dateformat)"
            } else {
                dateFormatter.dateFormat = "EEEE - \(dateformat)"
                return dateFormatter.string(from: self)
            }
        }
        return dateformat
    }
}
