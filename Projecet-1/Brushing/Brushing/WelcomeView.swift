//
//  WelcomeView.swift
//  Brushing
//
//  Created by Seymen Nadir Elmas on 15.11.2024.
//


import SwiftUI
import FirebaseFirestore

struct WelcomeView: View {
    @State private var userName: String = "User"
    private var db = Firestore.firestore()
    
    var body: some View {
        VStack {
            Text("Welcome, \(userName)!")
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.cyan.opacity(0.5))
                .frame(height: 100)
                .overlay(Text("This area is personal info"))
        }
        .onAppear {
            fetchUserData()
        }
    }
    
    private func fetchUserData() {
        if let userID = Auth.auth().currentUser?.uid {
            db.collection("users").document(userID).getDocument { snapshot, error in
                if let data = snapshot?.data(), let name = data["name"] as? String {
                    self.userName = name
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
