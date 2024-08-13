//
//  AnimatedBackground.swift
//  WhatsGood
//
//  Created by Gustavo Vazquez on 8/12/24.
//

import SwiftUI

struct AnimatedBackground: View {
    @State private var isAtBottom = true // State to track the current position of the gradient
    
    // Timer to trigger updates every 4 seconds
    let timer = Timer.publish(every: 4,
                              on: .main,
                              in: .common)
                        .autoconnect() // Automatically connect the timer to the run loop
    
    var body: some View {
        // Linear gradient background with dynamic start and end points
        LinearGradient(
            gradient: Gradient(colors: [
                Color(.black), // Start color of the gradient
                Color("GradientTopColor"), // Custom color from assets for gradient top
                Color("GradientMiddleColor"), // Custom color from assets for gradient middle
                Color("GradientBottomColor") // Custom color from assets for gradient bottom
            ]),
            startPoint: .top, // Gradient starts at the top
            // End point of the gradient dynamically changes based on `isAtBottom`
            endPoint: isAtBottom ? UnitPoint(x: 0.5, y: 1.2) : .center // Move the gradient end point off screen for a more appeasing look
        )
        // Animation to smoothly transition the gradient's end point
        .animation(Animation.easeInOut(duration: 8) // Duration of the animation (4 secs in, 4 secs out)
            .repeatForever(autoreverses: true), // Repeat the animation forever with reverses
                value: isAtBottom) // Animate when `isAtBottom` changes
            .onReceive(timer, perform: { _ in
                isAtBottom.toggle() // Toggle the `isAtBottom` state every 4 seconds
        })
        .ignoresSafeArea()
    }
}

#Preview {
    AnimatedBackground()
}
