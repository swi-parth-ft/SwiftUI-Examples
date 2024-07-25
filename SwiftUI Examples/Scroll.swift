//
//  ScrollView.swift
//  SwiftUI Examples
//
//  Created by Parth Antala on 2024-07-25.
//

import SwiftUI

struct Scroll: View {
    @State private var items = 100
    @State private var position = ScrollPosition(edge: .top)
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
            
            ScrollView {
                ForEach(0..<items, id: \.self) { i in
                    Text("Row \(i)")
                }
            }
            .onScrollGeometryChange(for: Double.self) { geo in
                geo.contentSize.height
            } action: { oldValue, newValue in
                print("Height is now \(newValue)")
            }
            
            Button("Add row") { items += 1 }
            
            ScrollView {
                ForEach(0..<100) { i in
                    Text("item \(i)")
                        .padding()
                        .id(i)
                }
            }
            .scrollPosition($position)
            
            HStack(spacing: 50) {
                Button("Top") {
                    position.scrollTo(edge: .top)
                }
                
                Button("Bottom") {
                    position.scrollTo(edge: .bottom)
                }
                
                Button("Random") {
                    position.scrollTo(id: Int.random(in: 0..<100))
                }
            }
            
        }
    }
}

#Preview {
    Scroll()
}
