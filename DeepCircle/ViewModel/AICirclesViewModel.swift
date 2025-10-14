//
//  AICirclesViewModel.swift
//  DeepCircle
//
//  Created by Didier Delhaisse on 14/10/2025.
//

import Foundation

@Observable
class AICirclesViewModel {
    enum Dataset: String, CaseIterable, Identifiable {
        case aiLayer = "AI Layer"
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
    
//    func apply(dataset: Dataset) {
//        selectedDataset = dataset
//        switch dataset {
//        case .aiLayer:
//            layers = Self.layersInstance
//        case .learningTypes:
//            layers = Self.selectedDataset
//        }
//        focused = nil
//    }
}
