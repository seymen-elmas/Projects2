//
//  TransferFoundsScreen.swift
//  BankApp
//
//  Created by Seymen Nadir Elmas on 13.09.2024.
//

import SwiftUI

struct TransferFundsScreen: View {
    
    @ObservedObject private var transferFundsVM = TransferFundsViewModel()
    @State private var showSheet = false
    @State private var isFromAccount = false
    
    var actionSheetButtons: [Alert.Button] {
        
        var actionButtons = self.transferFundsVM.filteredAccounts.map { account in
            Alert.Button.default(Text("\(account.name) (\(account.accountType))")) {
                if self.isFromAccount {
                    self.transferFundsVM.fromAccount = account
                } else {
                    self.transferFundsVM.toAccount = account
                }
            }
        }
        
        actionButtons.append(.cancel())
        return actionButtons
    }
    
    var body: some View {
        VStack {
            AccountListView(accounts: self.transferFundsVM.accounts)
                .frame(height: 300)
            
            TransferFundsAccountSelectionView(transferFundsVM: self.transferFundsVM, showSheet: $showSheet, isFromAccount: $isFromAccount)
                Spacer()
                .onAppear {
                    self.transferFundsVM.populateAccounts()
            }
            
            Button("Submit Transfer"){
                
            }.padding()
                .actionSheet(isPresented: $showSheet) {
                    ActionSheet(title: Text("Transfer Funds"), message: Text("Choose an account"), buttons: self.actionSheetButtons)
            }
            
            }.navigationBarTitle("Transfer Funds").embedInNavigationView()
    }
}


#Preview {
    TransferFundsScreen()
}

struct TransferFundsAccountSelectionView: View {
    
    @ObservedObject var transferFundsVM: TransferFundsViewModel
    @Binding var showSheet: Bool
    @Binding var isFromAccount: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            Button("From \(self.transferFundsVM.fromAccountType)") {
                self.isFromAccount = true
                self.showSheet = true
            }.padding().frame(maxWidth: .infinity)
                .background(Color.green)
                .foregroundColor(Color.white)
            
            Button("To \(self.transferFundsVM.toAccountType)") {
                self.isFromAccount = false
                self.showSheet = true
            }.padding().frame(maxWidth: .infinity)
                .background(Color.green)
                .foregroundColor(Color.white)
                .opacity(self.transferFundsVM.fromAccount != nil ? 1:0.5)
                .disabled(self.transferFundsVM.fromAccount == nil)
            TextField("Ammount", text: self.$transferFundsVM.amount)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
        }.padding()
    }
}

