//
//  ContentView.swift
//  WhatsGood
//
//  Created by Gustavo Vazquez on 8/8/24.
//

import SwiftUI

struct WelcomeView: View {

    var body: some View {
        NavigationStack {
            ZStack {
                AnimatedBackground()
                VStack {
                    VStack {
                        Image("WelcomeImage")
                            .resizable()
                            .scaledToFill()
                            .shadow(color: .blue.opacity(0.7), radius: 5)
                            .frame(width: UIScreen.main.bounds.width, height: 100)
                            .padding(.vertical, 150)
                    }
                    Spacer()
                        Text("This is a placeholder for any long motivational quote or advice. This will show multiple line to see how placement is set. ")
                            .shadow(radius: 5, x: 0, y: 5)
                            .multilineTextAlignment(.center)
                            .padding()
                            .background(.white.opacity(0.4))
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    Spacer()
                    VStack {
                        NavigationLink("Enter User", destination: UserView())
                            .padding()
                            .background(Color.blue)
                            .foregroundStyle(Color.white)
                            .bold()
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .shadow(radius: 5, x: 0, y: 5)
                        NavigationLink("Enter to Register", destination: UserRegistrationView())
                            .padding()
                            .background(Color.blue)
                            .foregroundStyle(Color.white)
                            .bold()
                            .clipShape(RoundedRectangle(cornerRadius: 25.0))
                            .shadow(radius: 5, x: 0, y: 5)

                    }
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
