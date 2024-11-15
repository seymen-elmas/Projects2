//
//  AuthenticationViewModel.swift
//  Brushing
//
//  Created by Seymen Nadir Elmas on 13.11.2024.
//


import SwiftUI
import FirebaseAuth

class AuthenticationViewModel: ObservableObject {
    @Published var isSignedIn = false
    @Published var errorMessage: String?

    init() {
        isSignedIn = Auth.auth().currentUser != nil
    }
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = "Login failed: \(error.localizedDescription)"
                return
            }
            self.isSignedIn = true
        }
    }

    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = "Sign up failed: \(error.localizedDescription)"
                return
            }
            self.isSignedIn = true
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            isSignedIn = false
        } catch {
            self.errorMessage = "Sign out failed: \(error.localizedDescription)"
        }
    }
}
