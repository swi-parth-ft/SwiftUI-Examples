//
//  Geometry.swift
//  SwiftUI Examples
//
//  Created by Parth Antala on 2024-07-24.
//

import SwiftUI

struct Geometry: View {
    
    @State private var textFrame = CGRect.zero
    @State private var textSize = 17.0
    
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .font(.system(size: textSize))
                .onGeometryChange(for: CGRect.self) { proxy in
                    proxy.frame(in: .global)
                } action: { newValue in
                    textFrame = newValue
                }
            
            Rectangle()
                .frame(width: textFrame.width, height: textFrame.height)
            
            Slider(value: $textSize, in: 10...30)
                .padding()
                   
        }
    }
}

#Preview {
    Geometry()
}
