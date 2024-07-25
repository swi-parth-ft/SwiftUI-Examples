//
//  ScrollView.swift
//  SwiftUI Examples
//
//  Created by Parth Antala on 2024-07-25.
//

import SwiftUI

struct Scroll: View {
    var body: some View {
        VStack {
            ScrollView {
                ForEach(0..<100) { i in
                    RoundedRectangle(cornerRadius: 22)
                        .fill(.orange)
                        .frame(height: 80)
                        .scrollTransition(.animated.threshold(.visible(0.9))) { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1 : 0)
                                .scaleEffect(phase.isIdentity ? 1 : 0.75)
                                .blur(radius: phase.isIdentity ? 0 : 10)
                                .hueRotation(.degrees(45 * phase.value))
                        }
                        .padding(.horizontal)
                }
            }
        }
    }
}

#Preview {
    Scroll()
}
