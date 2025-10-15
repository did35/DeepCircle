//
//  RootView.swift
//  DeepCircle
//
//  Created by Didier Delhaisse on 14/10/2025.
//

import SwiftUI

struct RootView: View {
    @Environment(AICirclesViewModel.self) private var vm
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, \(vm.selectedDataset.rawValue)!")
        }
        .padding()
    }
}

#Preview {
    RootView()
        .environment(AICirclesViewModel.aiModel) // ⚠️ Inject for preview.
}
