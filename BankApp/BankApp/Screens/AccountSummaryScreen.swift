//
//  AccountSummaryScreen.swift
//  BankApp
//
//  Created by Seymen Nadir Elmas on 12.09.2024.
//

import SwiftUI

struct AccountSummaryScreen: View {
    @ObservedObject private var accountSummaryVm = AccountSummaryViewModel()
    var body: some View {
        VStack {
            GeometryReader{ g in
                VStack {
                    AccountListView(accounts: self.accountSummaryVm.accounts)
                        .frame(height:g.size.height/2)
                    Text("Total :\(self.accountSummaryVm.total.formatAsCurrency())")
                    Spacer()
                }
                
            }
          
                .onAppear{
                    self.accountSummaryVm.getAllAccounts()
                }
        }.navigationBarTitle("Account Summary")
            .embedInNavigationView()
    }
}

#Preview {
    AccountSummaryScreen()
}
