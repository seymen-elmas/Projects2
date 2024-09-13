//
//  AccountSummaryScreen.swift
//  BankApp
//
//  Created by Seymen Nadir Elmas on 12.09.2024.
//

import SwiftUI

struct AccountSummaryScreen: View {
    
    @ObservedObject private var accountSummaryVM = AccountSummaryViewModel()
    
    @State private var isPresented: Bool = false
    
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

        }
        .onAppear {
                self.accountSummaryVM.getAllAccounts()
        }
        .sheet(isPresented: $isPresented, onDismiss: {
            // get all accounts
            self.accountSummaryVM.getAllAccounts()
        }) {
            AddAccountScreen()
        }
        .navigationBarItems(trailing: Button("Add Account") {
            self.isPresented = true
        })
        
        .navigationBarTitle("Account Summary")
        .embedInNavigationView()
    }
}

#Preview {
    AccountSummaryScreen()
}
