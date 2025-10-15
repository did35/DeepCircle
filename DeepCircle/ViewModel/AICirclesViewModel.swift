//
//  AICirclesViewModel.swift
//  DeepCircle
//
//  Created by Didier Delhaisse on 14/10/2025.
//

import SwiftUI

@Observable
class AICirclesViewModel {
    enum Dataset: String, CaseIterable, Identifiable {
        case aiLayers = "AI Layers"
        case learningTypes = "Learning Types"
        
        var id: String { rawValue }
    }
    
    // MARK: - State
    var selectedDataset: Dataset
    var layers: [AILayer]
    var focused: AILayer?
    
    // MARK: - Init
    init(selectedDataset: Dataset, layers: [AILayer]) {
        self.selectedDataset = selectedDataset
        self.layers = layers
    }
    
    // MARK: - Action
    func toggleFocus(_ layer: AILayer) {
        focused = focused == layer ? nil : layer
    }
    
    func opacity(for layer: AILayer) -> Double {
        guard let f = focused else { return 1.0 }
        return f == layer ? 1.0 : 0.45
    }
    
    func apply(dataset: Dataset) {
        selectedDataset = dataset
        switch dataset {
        case .aiLayers:
            layers = Self.aiLayersData
        case .learningTypes:
            layers = Self.learningTypesData
        }
        focused = nil
    }
}

extension AICirclesViewModel {
    static var aiModel: AICirclesViewModel {
        .init(selectedDataset: .aiLayers, layers: aiLayersData)
    }
    
    static let aiLayersData: [AILayer] = [
        .init(title: "ARTIFICIAL INTELLIGENCE",
              subTitle: "Programs that can sense, reason, act, and adapt.",
              scale: 1.0,
              color: Color(red: 0/255, green: 58/255, blue: 112/255),
              labelYOffset: -0.18),
        .init(title: "MACHINE LEARNING",
              subTitle: "Algorithms improving with experience.",
              scale: 0.68,
              color: Color(red: 16/255, green: 97/255, blue: 162/255),
              labelYOffset: 0.02),
        .init(title: "DEEP LEARNING",
              subTitle: "Multilayer neural networks learning from vast data.",
              scale: 0.42,
              color: Color(red: 55/255, green: 162/255, blue: 206/255),
              labelYOffset: -0.10)
        ]
    
    static let learningTypesData: [AILayer] = [
        .init(title: "SUPERVISED LEARNING",
              subTitle: "Models trained on labeled datasets",
              scale: 1.0,
              color: Color(red: 24/255, green: 88/255, blue: 155/255),
              labelYOffset: -0.12),
        .init(title: "REINFORCEMENT LEARNING",
              subTitle: "Agents learn via rewards & penalties",
              scale: 0.68,
              color: Color(red: 62/255, green: 142/255, blue: 203/255),
              labelYOffset: -0.12)
        ]
}
