//
//  SignupView.swift
//  ThoothBrushing
//
//  Created by Seymen Nadir Elmas on 3.11.2024.
//

import SwiftUI

struct SignUpView: View {
    @StateObject private var authViewModel = AuthenticationViewModel()
    @State private var email = ""
    @State private var password = ""

    var body: some View {
        VStack {
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(.none)
            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            if let errorMessage = authViewModel.errorMessage {
                Text(errorMessage)
                    .foregroundColor(.red)
                    .font(.caption)
            }

            Button(action: {
                authViewModel.signUp(email: email, password: password)
            }) {
                Text("Sign Up")
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.top)
        }
        .padding()
        .navigationTitle("Sign Up")
        .fullScreenCover(isPresented: $authViewModel.isSignedIn) {
            DashboardView()
        }
    }
}

#Preview {
    SignUpView()
}
