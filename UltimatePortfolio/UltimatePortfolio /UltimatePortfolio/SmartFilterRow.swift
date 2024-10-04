//
//  SmartFilterRow.swift
//  UltimatePortfolio
//
//  Created by Seymen Nadir Elmas on 2.10.2024.
//
import SwiftUI

struct SmartFilterRow: View {
    var filter: Filter

    var body: some View {
        NavigationLink(value: filter) {
            Label(LocalizedStringKey(filter.name), systemImage: filter.icon)
        }
    }
}
#Preview {
    SmartFilterRow(filter: .all)
}
