//
//  WelcomePage.swift
//  DatabaseApp
//
//  Created by Pablo Lasarte on 4/8/24.
//

import SwiftUI

struct WelcomePage: View {
    @State private var isShowingNextView = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                // Welcome message
                Image("PremierLeague")
                    .resizable()
                    .scaledToFit()
                
                Text("Welcome!")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                Text("Discover the latest stats, standings, and more about your favorite teams.")
                    .font(.headline)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                // Proceed button
                Button(action: {
                    isShowingNextView = true
                }) {
                    Text("Get Started")
                        .foregroundColor(.white)
                        .frame(width: 280, height: 44)
                        .background(Color.blue)
                        .cornerRadius(22)
                }
                .padding(.bottom, 50)
                .navigationBarHidden(true)
                .background(
                    NavigationLink(isActive: $isShowingNextView) {
                        NextView()
                    } label: {
                        EmptyView()
                    }
                )
            }
        }
    }
}

struct NextView: View {
    var body: some View {
        MainMenuView()
            .navigationBarHidden(true)
    }
}


#Preview {
    WelcomePage()
}
