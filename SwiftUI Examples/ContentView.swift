//
//  ContentView.swift
//  SwiftUI Examples
//
//  Created by Parth Antala on 2024-07-24.
//

import SwiftUI


struct ContentView: View {
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var completionAmount = 0.0
    
    var body: some View {
        VStack {
                Rectangle()
                    .trim(from: 0, to: completionAmount)
                    .stroke(Color.orange, lineWidth: 10)
                    .frame(width: 200, height: 200)
                    .rotationEffect(.degrees(-90))
                    .onReceive(timer) { _ in
                        withAnimation {
                            if completionAmount == 1 {
                                completionAmount = 0
                            } else {
                                completionAmount += 0.2
                            }
                        }
                    }
        VStack {
            Circle()
                .union(.capsule.inset(by: 100))
                .fill(.blue)
                .rotationEffect(.degrees(-90))
        }
        .frame(width: 250)
        
        Circle()
            .lineSubtraction(.rect.inset(by: 30))
            .stroke(style: .init(lineWidth: 20, lineCap: .round))
        
        Circle()
            .offset(x: -50)
            .symmetricDifference(.circle.offset(x: 50))
            .fill(.orange)
            .padding()
    }
    }
}

#Preview {
    ContentView()
}
