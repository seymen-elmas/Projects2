//
//  SignUpView.swift
//  Brushing
//
//  Created by Seymen Nadir Elmas on 13.11.2024.
//


import SwiftUI

struct SignUpView: View {
    @StateObject private var authViewModel = AuthenticationViewModel()
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack(spacing: 20) {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if let errorMessage = authViewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
            }

            Button(action: {
                authViewModel.signUp(email: email, password: password)
            }) {
                Text("Sign Up")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .navigationTitle("Sign Up")
        .fullScreenCover(isPresented: $authViewModel.isSignedIn) {
            DashBoardView()
        }
    }
}
