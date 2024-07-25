//
//  Pickers.swift
//  SwiftUI Examples
//
//  Created by Parth Antala on 2024-07-25.
//

import SwiftUI

struct Pickers: View {
    
    @State private var birthDate = Date.now
    
    
    var body: some View {
        VStack {
            DatePicker(selection: $birthDate, in: ...Date.now, displayedComponents: .date) {
                Text("Select a date")
            }
            
            Text("Date is \(birthDate.formatted(date: .long, time: .omitted))")
        }
    }
}

#Preview {
    Pickers()
}
