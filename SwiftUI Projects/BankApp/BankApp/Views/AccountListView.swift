//
//  AccountListView.swift
//  BankApp
//
//  Created by Seymen Nadir Elmas on 12.09.2024.
//

import SwiftUI

struct AccountListView: View {
    let accounts : [AccountViewModel]
    var body: some View {
        List(accounts, id : \.accountId) { account in
            AccountCell(account: account)
            
        }
    }
}
struct AccountCell: View {
    let account : AccountViewModel
    var body: some View {
        
        HStack{
            
            VStack(alignment: .leading,spacing: 10){
                Text(account.name)
                    .font(.headline)
                Text(account.accountType)
                    .opacity(0.5)
            }
            Spacer()
            Text("\(account.balance.formatAsCurrency())")
                .foregroundColor(.green)
        }
    }
}

#Preview {
    let account = Account(id: UUID(), name: "Jhon Doe", accountType: .checking, balance: 200)
    let accountVM = AccountViewModel(account: account)
   return AccountListView(accounts: [accountVM])
  
}

