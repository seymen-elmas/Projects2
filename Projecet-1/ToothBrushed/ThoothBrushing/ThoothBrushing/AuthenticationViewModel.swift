//
//  AuthenticationViewModel.swift
//  ThoothBrushing
//
//  Created by Seymen Nadir Elmas on 3.11.2024.
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
                self.errorMessage = "Error signing in: \(error.localizedDescription)"
                return
            }
            self.isSignedIn = true
        }
    }

    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = "Error signing up: \(error.localizedDescription)"
                return
            }
            self.isSignedIn = true
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            isSignedIn = false
        } catch let error {
            errorMessage = "Error signing out: \(error.localizedDescription)"
        }
    }
}
