//
//  UserView.swift
//  WhatsGood
//
//  Created by Gustavo Vazquez on 8/12/24.
//

import SwiftUI

struct LoginOrRegisterView: View {
    // Binding variable to control the presentation of this view
    @Binding var showLoginOrRegisterView: Bool

    var body: some View {
        ZStack {
            // Background color for the view
            AnimatedBackground()
            
            VStack {
                Text("Login or Register")
                    .font(.largeTitle)
                    .foregroundStyle(Color.white)
                    .padding()
                
                Spacer()
            }
            .gesture(
                // DragGesture to detect swipe down
                DragGesture()
                    .onEnded { value in
                        if value.translation.height > 50 { // Detect downward swipe
                            showLoginOrRegisterView = false
                        }
                    }
            )
        }
    }
}

#Preview {
    LoginOrRegisterView(showLoginOrRegisterView: .constant(true))
}
