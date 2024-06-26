//
//  CustomCircleView.swift
//  Hiking App
//
//  Created by Timotius Leonardo Lianoto on 11/04/24.
//

import SwiftUI

struct CustomCircleView: View {
    @State private var isAnimateGradient: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                        .customIndigoMedium,
                            .customSalmonLight
                    ],
                                   
                        startPoint: isAnimateGradient ? .topLeading : .bottomLeading,
                        endPoint: isAnimateGradient ? .bottomTrailing : .topTrailing)
                )
            
            MotionAnimationView()
        }.frame(width: 256, height: 256)
    }
}

#Preview {
    CustomCircleView()
}
