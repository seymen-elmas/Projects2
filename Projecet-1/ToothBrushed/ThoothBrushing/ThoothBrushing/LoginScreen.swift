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
        VStack(spacing:0.5) {
            Text("Welcome Thooth Brushing")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
            Image("TBT3")
                .resizable()
               
                .frame(width:450,height: 450,alignment: .top)
                
            VStack(spacing:20) {
                
               
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color.white.opacity(0.4))
                    .cornerRadius(8)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white.opacity(0.4))
                    .cornerRadius(8)
                
                Button("Sign In") {
                    signUp()
                }
                .padding()
                .background(Color.green)
                .foregroundColor(.white)
                .cornerRadius(8)
                
                Button("Sign Up") {
                    login()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(8)
                
                if !errorMessage.isEmpty {
                    Text(errorMessage)
                        .foregroundColor(.red)
                }
            }
            .padding()
            .background(       RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.55, blue: 0.8), location: 0.3),
                .init(color: Color(red: 0.60, green: 1.52, blue: 2.38), location: 0.9)
            ], center: .top, startRadius: 00, endRadius: 700)
                .ignoresSafeArea()
            )
            .opacity(0.8)
        }
        .background( Color(red:0.1,green: 0.55,blue:2.38))
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
