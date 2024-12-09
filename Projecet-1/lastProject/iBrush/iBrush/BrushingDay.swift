//
//  BrushingDay.swift
//  iBrush
//
//  Created by Seymen Nadir Elmas on 23.11.2024.
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
    @Published var achievements: [String] = ["Başarı Rozeti 1", "Başarı Rozeti 2"]
    @Published var userName: String = "Kullanıcı"

    private let db = Firestore.firestore()
    
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
    
    func saveBrushingTime(duration: Int) {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        let data: [String: Any] = [
            "date": Date(),
            "duration": duration
        ]
        
        db.collection("users").document(userID).collection("brushingHistory").addDocument(data: data)
    }

    func fetchUserName() {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        db.collection("users").document(userID).getDocument { snapshot, error in
            if let data = snapshot?.data(), let name = data["userName"] as? String {
                self.userName = name
            }
        }
    }

    func updateUserName(newName: String) {
        guard let userID = Auth.auth().currentUser?.uid else { return }
        
        db.collection("users").document(userID).setData(["userName": newName], merge: true) { error in
            if error == nil {
                self.userName = newName
            }
        }
    }
}


