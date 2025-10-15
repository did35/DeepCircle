//
//  DeepCircleApp.swift
//  DeepCircle
//
//  Created by Didier Delhaisse on 14/10/2025.
//

import SwiftUI

@main
struct DeepCircleApp: App {
    @State private var vm = AICirclesViewModel.aiModel
    
    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(vm) // Swift 6.0: Inject @Observable into environment.
        }
    }
}
