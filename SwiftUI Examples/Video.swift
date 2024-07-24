//
//  Video.swift
//  SwiftUI Examples
//
//  Created by Parth Antala on 2024-07-24.
//

import SwiftUI
import AVKit
struct Video: View {
    var body: some View {
        VideoPlayer(player: AVPlayer(url: URL(string: "https://embed-ssl.wistia.com/deliveries/cc8402e8c16cc8f36d3f63bd29eb82f99f4b5f88/accudvh5jy.mp4")!))
            .frame(height: 200)
    }
}

#Preview {
    Video()
}
