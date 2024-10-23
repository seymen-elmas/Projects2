//
//  MouthRegionView.swift
//  ThoothBrushing
//
//  Created by Seymen Nadir Elmas on 23.10.2024.
//

import SwiftUI

struct MouthRegionView: View {
    @State var regionsBrushed: [Bool] = [false, false, false, false] // 4 bölge

    var body: some View {
        VStack {
            Text("Fırçalanan Bölgeler")
                .font(.headline)
            
            HStack {
                RegionView(isBrushed: regionsBrushed[0], label: "Üst Sol")
                RegionView(isBrushed: regionsBrushed[1], label: "Üst Sağ")
            }
            HStack {
                RegionView(isBrushed: regionsBrushed[2], label: "Alt Sol")
                RegionView(isBrushed: regionsBrushed[3], label: "Alt Sağ")
            }
        }
        .padding()
    }
}

struct RegionView: View {
    var isBrushed: Bool
    var label: String

    var body: some View {
        VStack {
            Circle()
                .fill(isBrushed ? Color.green : Color.gray)
                .frame(width: 80, height: 80)
            Text(label)
                .font(.caption)
        }
    }
}


#Preview {
    MouthRegionView()
}
