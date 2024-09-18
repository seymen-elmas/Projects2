//
//  AccountSummaryScreen.swift
//  BankApp
//
//  Created by Seymen Nadir Elmas on 12.09.2024.
//

import SwiftUI

struct AccountSummaryScreen: View {
    enum ActiveSheet {
        case addAccount
        case transferFunds
    }
    
    @ObservedObject private var accountSummaryVM = AccountSummaryViewModel()
    
    @State private var isPresented: Bool = false
    @State private var activeSheet: ActiveSheet = .addAccount
    
    
    var body: some View {
            
        VStack {
            GeometryReader { g in
                VStack {
                    AccountListView(accounts: self.accountSummaryVM.accounts)
                        .frame(height: g.size.height/2)
                    Text("\(self.accountSummaryVM.total.formatAsCurrency())")
                    Spacer()
                }
            }
            Button("TransferFunds"){
                self.activeSheet = .transferFunds
                self.isPresented = true
            }
            
        }
        .onAppear {
                self.accountSummaryVM.getAllAccounts()
        }
        .sheet(isPresented: $isPresented, onDismiss: {
            // get all accounts
            self.accountSummaryVM.getAllAccounts()
        }) {
            
            if self.activeSheet == .transferFunds {
                TransferFundsScreen()
            } else if self.activeSheet == .addAccount {
                 AddAccountScreen()
            }
        }
        .navigationBarItems(trailing: Button("Add Account") {
            self.activeSheet = .addAccount
            self.isPresented = true
        })
        
        .navigationBarTitle("Account Summary")
        .embedInNavigationView()
    }
}

#Preview {
    AccountSummaryScreen()
}
