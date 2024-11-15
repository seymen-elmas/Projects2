//
//  DashboardViewModel.swift
//  ThoothBrushing
//
//  Created by Seymen Nadir Elmas on 28.10.2024.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

// BrushingData yapısı
struct BrushingData: Identifiable {
    var id: String
    let day: String
    let duration: Int
}

// Dashboard için ViewModel
class DashboardViewModel: ObservableObject {
    @Published var brushingData: [BrushingData] = []
    @Published var userID: String?
    
    private var db = Firestore.firestore()
    
    init() {
        fetchUserID()
        fetchBrushingData()
    }
    
    // Kullanıcı kimliğini getir
    private func fetchUserID() {
        if let user = Auth.auth().currentUser {
            self.userID = user.uid
        }
    }

    // Firestore'dan fırçalama verilerini getir
    func fetchBrushingData() {
        guard let userID = userID else { return }
        
        db.collection("users").document(userID).collection("brushingData").getDocuments { snapshot, error in
            if let error = error {
                print("Error fetching brushing data: \(error)")
                return
            }
            
            self.brushingData = snapshot?.documents.compactMap { document in
                let data = document.data()
                let day = data["day"] as? String ?? ""
                let duration = data["duration"] as? Int ?? 0
                return BrushingData(id: document.documentID, day: day, duration: duration)
            } ?? []
        }
    }
}
