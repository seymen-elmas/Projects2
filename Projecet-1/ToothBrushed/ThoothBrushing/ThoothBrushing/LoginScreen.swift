//
//  LoginScreen.swift
//  ThoothBrushing
//
//  Created by Seymen Nadir Elmas on 23.10.2024.
//

import SwiftUI
import FirebaseAuth
struct LoginScreen: View {
    @State private var email = ""
        @State private var password = ""
        @State private var errorMessage = ""

        var body: some View {
            VStack(spacing: 20) {
                Text("Welcome Thooth Brushing")
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)

                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)

                Button("Sign Up") {
                    signUp()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)

                Button("Login") {
                    login()
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(8)

                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
            }
            .padding()
        }

        private func signUp() {
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    errorMessage = error.localizedDescription
                } else {
                    errorMessage = "User created successfully!"
                }
            }
        }

        private func login() {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    errorMessage = error.localizedDescription
                } else {
                    errorMessage = "Login successful!"
                }
            }
        }
    }


#Preview {
    LoginScreen()
}
