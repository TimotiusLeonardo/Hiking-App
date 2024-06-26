//
//  MotionAnimationView.swift
//  Hiking App
//
//  Created by Timotius Leonardo Lianoto on 11/04/24.
//

import SwiftUI

struct MotionAnimationView: View {
    @State private var randomCircle: Int = Int.random(in: 10...14)
    @State private var isAnimating: Bool = false
    
    // MARK: - Functions
    
    // 1. RANDOM COORDINATE
    func randomCoordinate() -> CGFloat {
        return .random(in: 0...200)
    }
    // 2. RANDOM SIZE
    func randomSize() -> CGFloat {
        return .random(in: 10...80)
    }
    // 3. RANDOM SCALE
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    // 4. RANDOM SPEED
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...1.0)
    }
    // 5. RANDOM DELAY
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    var body: some View {
        ZStack {
            ForEach(0...randomCircle, id: \.self) { item in
                Circle()
                    .foregroundStyle(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(x: randomCoordinate(), y: randomCoordinate())
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                        withAnimation(
                            .interpolatingSpring(stiffness: 0.25, damping: 0.25)
                            .repeatForever()
                            .speed(randomSpeed())
                            .delay(randomDelay())
                        ) {
                            isAnimating = true
                        }
                    })
            }
        } //: ZSTACK
        .frame(width: 256, height: 256)
        .mask(Circle())
        .drawingGroup()
    }
}

#Preview {
    MotionAnimationView()
        .background(
            Circle().fill(.teal)
        )
}
