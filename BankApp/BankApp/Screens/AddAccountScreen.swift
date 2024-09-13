//
//  AddAccountScreen.swift
//  BankApp
//
//  Created by Seymen Nadir Elmas on 13.09.2024.
//

import SwiftUI

struct AddAccountScreen: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject private var addAccountVM = AddAccountViewModel()
    
    var body: some View {
        Form {
            TextField("Name", text: self.$addAccountVM.name)
            Picker(selection: self.$addAccountVM.accountType, label: EmptyView()) {
                ForEach(AccountType.allCases, id: \.self) { accountType in
                    Text(accountType.title).tag(accountType)
                }
            }.pickerStyle(SegmentedPickerStyle())
            TextField("Balance", text: self.$addAccountVM.balance)
            HStack {
                Spacer()
                Button("Submit") {
                    self.addAccountVM.createAccount { success in
                        if success {
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
                Spacer()
            }
            
            Text(self.addAccountVM.errorMessage)
            
            
        }
        
        .navigationBarTitle("Add Account")
        .embedInNavigationView()
    }
        
    
}

#Preview {
    AddAccountScreen()
}
