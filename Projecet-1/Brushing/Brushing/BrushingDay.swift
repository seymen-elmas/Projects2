//
//  BrushingDay.swift
//  Brushing
//
//  Created by Seymen Nadir Elmas on 18.11.2024.
//


import Foundation
import FirebaseFirestore
import FirebaseAuth

struct BrushingDay: Identifiable {
    var id: String
    var date: Date
    var duration: Int
}

class FirestoreService: ObservableObject {
    @Published var brushingDays: [BrushingDay] = []
    @Published var dailyBrushingTime: Int = 0
    @Published var achievements: [String] = ["Rozet 1", "Rozet 2", "Rozet 3"] 
    
    private var db = Firestore.firestore()
    
    func fetchBrushingData() {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        db.collection("users").document(userID).collection("brushingHistory").getDocuments { snapshot, error in
            if let documents = snapshot?.documents {
                self.brushingDays = documents.compactMap { doc in
                    let data = doc.data()
                    let timestamp = data["date"] as? Timestamp
                    let duration = data["duration"] as? Int
                    return BrushingDay(id: doc.documentID, date: timestamp?.dateValue() ?? Date(), duration: duration ?? 0)
                }
                
                self.dailyBrushingTime = self.brushingDays.last?.duration ?? 0
            }
        }
    }
}
