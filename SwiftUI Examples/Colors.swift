//
//  Colors.swift
//  SwiftUI Examples
//
//  Created by Parth Antala on 2024-07-25.
//

import SwiftUI

struct Colors: View {
    @State private var bgColor = Color.orange
    var body: some View {
        VStack {
            ColorPicker("Set background Color", selection: $bgColor)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(bgColor)
    }
}

#Preview {
    Colors()
}
