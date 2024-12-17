//
//  EditUserNameView.swift
//  iBrush
//
//  Created by Seymen Nadir Elmas on 17.12.2024.
//

import SwiftUI

struct EditUserNameView: View {
    @ObservedObject var firestoreService: FirestoreService
    @Environment(\.dismiss) var dismiss
    @State private var newUserName: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Kullanıcı Adını Düzenle")
                .font(.largeTitle)
                .bold()

            TextField("Yeni Kullanıcı Adı", text: $newUserName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            HStack {
                Button(action: {
                    dismiss()
                }) {
                    Text("İptal")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }

                Button(action: {
                    firestoreService.saveUserName(newUserName)
                    dismiss()
                }) {
                    Text("Kaydet")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
            .padding()
        }
        .padding()
    }
}


#Preview {
    EditUserNameView(firestoreService: FirestoreService())
}
