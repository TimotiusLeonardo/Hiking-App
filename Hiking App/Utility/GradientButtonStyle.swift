//
//  GradientButtonStyle.swift
//  Hiking App
//
//  Created by Timotius Leonardo Lianoto on 10/04/24.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                // Conditional Statement with Nil coalescing
                // Confition ? A : B
                configuration.isPressed ?
                // A: When user pressed the button
                LinearGradient(colors: [.customGrayMedium, .customGrayLight], startPoint: .top, endPoint: .bottom)
                :
                // B: When the button is not pressed
                LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom)
            )
            .clipShape(RoundedRectangle(cornerRadius: 40))
    }
}
