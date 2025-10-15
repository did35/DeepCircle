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
        NavigationStack {
            VStack(spacing: 16) {
                Picker("Dataset", selection: .init(
                    get: { vm.selectedDataset },
                    set: { vm.apply(dataset: $0) }
                )) {
                    ForEach(AICirclesViewModel.Dataset.allCases) { ds in
                        Text(ds.rawValue).tag(ds)
                    }
                }
                .pickerStyle(.segmented)
                .padding([.horizontal, .vertical])
                
                ConcentricCirclesView()
                    .padding()
                    .animation(.spring(response: 0.35, dampingFraction: 0.85), value: vm.focused)
                
                // User guidance
                VStack(spacing: 6) {
                    Text("💡 Tip:")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                    Text("Tap a circle to focus on its layer, and tap again to reset.")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundStyle(.secondary)
                        .padding(.horizontal)
                }
                .padding(.bottom, 20)
            }
            .navigationTitle("AI Concentric Circles")
        }
    }
}

#Preview {
    RootView()
        .environment(AICirclesViewModel.aiModel) // ⚠️ Inject for preview.
}
