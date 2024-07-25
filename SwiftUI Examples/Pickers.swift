//
//  Pickers.swift
//  SwiftUI Examples
//
//  Created by Parth Antala on 2024-07-25.
//

import SwiftUI

struct Pickers: View {
    
    @State private var birthDate = Date.now
    @State private var dates: Set<DateComponents> = []
    
    @Environment(\.calendar) var calendar
    var summary: String {
        dates.compactMap { components in
            calendar.date(from: components)?.formatted(date: .long, time: .omitted)
        }.formatted()
    }
    
    let dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }()
    
    var body: some View {
        VStack {
            DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date) {
                Text("Select a date")
            }
            
//            DatePicker("Enter your birthday", selection: $birthDate)
//                .datePickerStyle(GraphicalDatePickerStyle())
//                .frame(maxHeight: 400)
            
            Text("Date is \(birthDate, formatter: dateFormatter)")
            
            MultiDatePicker("Select your preferred dates", selection: $dates, in: Date.now...)
            Text(summary)
            
        }
    }
}

#Preview {
    Pickers()
}
