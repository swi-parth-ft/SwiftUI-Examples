//
//  ViewAppearance.swift
//  SwiftUI Examples
//
//  Created by Parth Antala on 2024-07-24.
//

import SwiftUI

struct ViewAppearance: View {
    @State private var rotationAmount = 0.0
    var body: some View {
        VStack {
            ScrollView {
                ForEach(0..<100) { i in
                    Text("row \(i)")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity)
                        .visualEffect { content, proxy in
                            content.blur(radius: blurAmount(for: proxy))
                        }
                }
            }
            .frame(height: 200)
            
            Grid {
                ForEach(0..<3) { i in
                    GridRow {
                        ForEach(0..<3) { j in
                            Circle()
                                .fill(.orange)
                                .frame(width: 50, height: 50)
                                .visualEffect { content, proxy in
                                    content.hueRotation(.degrees(proxy.frame(in: .global).midY / 2))
                                }
                        }
                    }
                }
            }
            .rotationEffect(.degrees(rotationAmount))
            .onAppear {
                withAnimation(.linear(duration: 5).repeatForever(autoreverses: false)) {
                    rotationAmount = 360
                }
            }
            Spacer()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(0..<10) { i in
                            Text("Item \(i)")
                            .foregroundStyle(.white)
                            .containerRelativeFrame(.horizontal, count: 5, span: 2, spacing: 10)
                            .background(.blue)
                    }
                }
            }
            Spacer()
        }
    }
    
    func blurAmount(for proxy: GeometryProxy) -> Double {
        let scrollViewHeight = proxy.bounds(of: .scrollView)?.height ?? 100
        let ourCenter = proxy.frame(in: .scrollView).midY
        let distanceFromCenter = abs(scrollViewHeight / 2 - ourCenter)
        return Double(distanceFromCenter / 100)
    }
}

#Preview {
    ViewAppearance()
}
