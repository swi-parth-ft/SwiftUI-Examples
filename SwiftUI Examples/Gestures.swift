//
//  Gestures.swift
//  SwiftUI Examples
//
//  Created by Parth Antala on 2024-07-25.
//

import SwiftUI

struct Gestures: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        RoundedRectangle(cornerRadius: 22)
            .fill(LinearGradient(colors: [.orange, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: 150, height: 100)
            .rotation3DEffect(.degrees(-Double(dragAmount.width) / 5), axis: (x: 0, y: 1, z: 0))
            .rotation3DEffect(.degrees(Double(dragAmount.width) / 5), axis: (x: 1, y: 0, z: 0))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation }
                    .onEnded({ _ in
                        withAnimation {
                            dragAmount = .zero
                        }
                    })
            )
        
    }
}

#Preview {
    Gestures()
}
