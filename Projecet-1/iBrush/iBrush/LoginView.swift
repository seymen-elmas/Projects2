//
//  LoginView.swift
//  iBrush
//
//  Created by Seymen Nadir Elmas on 23.11.2024.
//


import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isRegistering = false
    @State private var errorMessage = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text(isRegistering ? "Kayıt Ol" : "Giriş Yap")
                .font(.largeTitle)
                .bold()
            
            TextField("Email", text: $email)
                .keyboardType(.emailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            SecureField("Şifre", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button(action: {
                if isRegistering {
                    register()
                } else {
                    login()
                }
            }) {
                Text(isRegistering ? "Kayıt Ol" : "Giriş Yap")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Button(action: { isRegistering.toggle() }) {
                Text(isRegistering ? "Zaten hesabın var mı? Giriş Yap" : "Hesabın yok mu? Kayıt Ol")
                    .font(.caption)
            }
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
            }
        }
        .padding()
    }
    
    private func login() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                errorMessage = ""
            }
        }
    }
    
    private func register() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                errorMessage = error.localizedDescription
            } else {
                errorMessage = ""
            }
        }
    }
}
