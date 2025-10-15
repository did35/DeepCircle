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
            let side = min(geo.size.width, geo.size.height)
            
            ZStack {
                ForEach(vm.layers) { layer in
                    circle(for: layer, side: side)
                        .opacity(vm.opacity(for: layer))
                        .onTapGesture {
                            vm.toggleFocus(layer)
                        }
                        .accessibilityElement(children: .ignore)
                        .accessibilityLabel(Text(layer.title))
                        .accessibilityHint(Text(layer.subTitle))
                }
            }
            .frame(width: geo.size.width, height: geo.size.height)
        }
        .aspectRatio(1, contentMode: .fit)
        .contentShape(Rectangle())
    }
    
    @ViewBuilder
    private func circle(for layer: AILayer, side: CGFloat) -> some View {
        let diamater = side * layer.scale
        
        ZStack {
            Circle()
                .fill(layer.color)
            
            VStack(spacing: 6) {
                Text(layer.title)
                    .font(.system(size: diamater * 0.085, weight: .heavy))
                    .kerning(1)
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.5)
                    .foregroundStyle(.white)
                Text(layer.subTitle)
                    .font(.system(size: diamater * 0.048, weight: .semibold))
                    .multilineTextAlignment(.center)
                    .minimumScaleFactor(0.6)
                    .foregroundStyle(.white.opacity(0.9))
                    .padding(.horizontal, diamater * 0.08)
            }
            .offset(y: side * layer.labelYOffset)
        }
        .frame(width: diamater, height: diamater)
    }
}

#Preview {
    ConcentricCirclesView()
        .padding()
        .frame(width: 420, height: 420)
        .environment(AICirclesViewModel.aiModel)
}
