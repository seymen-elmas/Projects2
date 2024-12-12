//
//  EditUserNameView.swift
//  iBrush
//
//  Created by Seymen Nadir Elmas on 9.12.2024.
//


import SwiftUI

struct EditUserNameView: View {
    @ObservedObject var firestoreService: FirestoreService
    @State private var newName: String = ""

    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack(spacing: 20) {
            Text("Kullanıcı Adını Düzenle")
                .font(.largeTitle)
                .bold()

            TextField("Yeni Kullanıcı Adı", text: $newName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                firestoreService.updateUserName(newName: newName)
                presentationMode.wrappedValue.dismiss()
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
        .background(LinearGradient(colors: [.green,.mint,.cyan,.mint], startPoint: .topLeading, endPoint: .bottomTrailing))
        .onAppear {
            newName = firestoreService.userName
        }
    }
}
