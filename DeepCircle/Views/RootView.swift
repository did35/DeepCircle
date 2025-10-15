//
//  RootView.swift
//  DeepCircle
//
//  Created by Didier Delhaisse on 14/10/2025.
//

import SwiftUI

struct RootView: View {
    @Environment(AICirclesViewModel.self) private var vm
    @State private var showHint = true
    
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
                
                userGuidance
                    .opacity(showHint ? 1 : 0)
                    .animation(.easeInOut(duration: 1.0), value: showHint)
                
            }
            .navigationTitle("AI Concentric Circles")
            .task(id: vm.selectedDataset) {
                showHint = true
                await showAndFadeHint()
            }
        }
    }
    
    @MainActor
    private func showAndFadeHint() async {
        // Smooth fade-in
        withAnimation(.easeInOut(duration: 1.0)) {
            showHint = true
        }
        // Keep visible for 3s
        try? await Task.sleep(for: .seconds(3.0))
        // Smooth fade-out
        withAnimation(.easeInOut(duration: 1.0)) {
            showHint = false
        }
    }
}

extension RootView {
    private var userGuidance: some View {
        VStack(spacing: 8) {
            Image(systemName: "hand.tap")
                .font(.system(size: 40))
                .foregroundStyle(.gray.opacity(0.9))
            Text("Tap a circle to focus on its layer.")
                .font(.subheadline)
                .multilineTextAlignment(.center)
                .foregroundStyle(.gray)
        }
        .padding(30)
        .background(
            RoundedRectangle(cornerRadius: 20)
                .fill(.ultraThinMaterial)
                .shadow(radius: 10)
        )
        .opacity(showHint ? 1 : 0)
        .animation(.easeInOut(duration: 0.8), value: showHint)
        .transition(.opacity)
        .zIndex(1)
    }
}

#Preview {
    RootView()
        .environment(AICirclesViewModel.aiModel) // ⚠️ Inject for preview.
}
