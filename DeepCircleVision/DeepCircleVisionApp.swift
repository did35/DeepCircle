//
//  DeepCircleVisionApp.swift
//  DeepCircleVision
//
//  Created by Didier Delhaisse on 20/10/2025.
//

import SwiftUI

@main
struct DeepCircleVisionApp: App {

    @State private var vm = AICirclesViewModel.aiModel

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(vm)
                //.glassBackgroundEffect()
                .padding(24)
                .frame(width: 900, height: 700)
        }
        .windowStyle(.plain)

     }
}
