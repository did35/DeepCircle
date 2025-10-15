//
//  ConcentricCirclesView.swift
//  DeepCircle
//
//  Created by Didier Delhaisse on 15/10/2025.
//

import SwiftUI

struct ConcentricCirclesView: View {
    @Environment(AICirclesViewModel.self) var vm
    
    var body: some View {
        GeometryReader { geo in
            //let side = min(geo.size.width, geo.size.height)
            ZStack {
                circle()
                Text("Hello, \(vm.selectedDataset.rawValue)!")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
            }
            
            
        }
    }
    
    @ViewBuilder
    private func circle() -> some View {
        Circle()
            .foregroundStyle(.blue)
    }
}

#Preview {
    ConcentricCirclesView()
        .environment(AICirclesViewModel.aiModel)
}
