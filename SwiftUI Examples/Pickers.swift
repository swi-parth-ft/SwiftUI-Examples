//
//  Pickers.swift
//  SwiftUI Examples
//
//  Created by Parth Antala on 2024-07-25.
//

import SwiftUI

struct Pickers: View {
    
    @State private var birthDate = Date.now
    
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
            
            DatePicker("Enter your birthday", selection: $birthDate)
                .datePickerStyle(GraphicalDatePickerStyle())
                .frame(maxHeight: 400)
            
            Text("Date is \(birthDate, formatter: dateFormatter)")
        }
    }
}

#Preview {
    Pickers()
}
