//
//  AILayer.swift
//  DeepCircle
//
//  Created by Didier Delhaisse on 14/10/2025.
//

import SwiftUI

struct AILayer: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let subTitle: String
    let scale: CGFloat
    let color: Color
    let labelYOffset: CGFloat
}
