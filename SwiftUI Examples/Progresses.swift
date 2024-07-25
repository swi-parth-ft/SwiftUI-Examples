//
//  Progresses.swift
//  SwiftUI Examples
//
//  Created by Parth Antala on 2024-07-25.
//

import SwiftUI

struct Progresses: View {
    @State private var downloadAmount = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            ProgressView("Downloading...", value: downloadAmount, total: 100)
                .onReceive(timer) { _ in
                    if downloadAmount < 100 {
                        withAnimation(.smooth) {
                            downloadAmount += 2
                        }
                    }
                }
            
        }
    }
}

#Preview {
    Progresses()
}
