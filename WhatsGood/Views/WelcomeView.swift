//
//  ContentView.swift
//  WhatsGood
//
//  Created by Gustavo Vazquez on 8/8/24.
//

import SwiftUI

struct WelcomeView: View {
    // State to manage whether the user has swiped up to reveal the next view
    @State private var showLoginOrRegisterView = false

    var body: some View {
        NavigationStack {
            ZStack {
                // Custom animated background for the view
                AnimatedBackground()
                
                // Main content layout
                VStack {
                    // Image section
                    VStack {
                        Image("WelcomeImage") // Placeholder image
                            .resizable() // Make the image resizable
                            .scaledToFill() // Scale the image to fill its frame
                            .shadow(color: .blue.opacity(0.7), radius: 5) // Apply shadow with blue tint
                            .frame(width: UIScreen.main.bounds.width, height: 100) // Set image width to screen width, height to 100
                            .padding(.vertical, 150) // Add vertical padding around the image
                    }
                    
                    Spacer() // Adds space between elements, pushing content to the bottom
                        
                    // Text section for motivational quote or advice
                    Text("This is a placeholder for any long motivational quote or advice. This will show multiple line to see how placement is set.")
                        .shadow(radius: 5, x: 0, y: 5) // Adds shadow below the text
                        .multilineTextAlignment(.center) // Centers the text
                        .padding() // Adds padding inside the text background
                        .background(.white.opacity(0.4)) // Semi-transparent white background
                        .clipShape(RoundedRectangle(cornerRadius: 10)) // Rounded corners for the background

                    Spacer() // Adds space between elements, pushing content to the top
                    
                    // Swipe up instruction with icon
                    VStack {
                        Text("Swipe Up")
                            .font(.title2)
                            .foregroundColor(.white)
                        Image(systemName: "chevron.up")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .padding(.bottom, 40) // Padding to place the swipe up indicator
                }
                .gesture(
                    // DragGesture to detect swipe up
                    DragGesture()
                        .onEnded { value in
                            if value.translation.height < -50 { // Detect upward swipe
                                showLoginOrRegisterView = true
                            }
                        }
                )

                // Full-screen cover to present LoginOrRegisterView when swiped up
                .fullScreenCover(isPresented: $showLoginOrRegisterView) {
                    LoginOrRegisterView(showLoginOrRegisterView: $showLoginOrRegisterView)
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
