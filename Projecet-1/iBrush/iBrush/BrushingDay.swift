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
    let id: String
    let date: Date
    let duration: Int // Süre saniye cinsinden
}

class FirestoreService: ObservableObject {
    @Published var brushingDays: [BrushingDay] = []
    private let db = Firestore.firestore()

    func saveBrushingTime(duration: Int) {
        guard let userID = Auth.auth().currentUser?.uid else { return }

        let data: [String: Any] = [
            "date": Timestamp(date: Date()),
            "duration": duration
        ]
        
        db.collection("users").document(userID).collection("brushingHistory").addDocument(data: data) { error in
            if let error = error {
                print("Error saving brushing time: \(error.localizedDescription)")
            }
        }
    }

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
            }
        }
    }
}
