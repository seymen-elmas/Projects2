//
//  BrushingToothView2.swift
//  ThootBrush
//
//  Created by Seymen Nadir Elmas on 21.10.2024.
//

import SwiftUI

struct BrushingToothView2: View {
    @ObservedObject var viewModel = ToothViewModel2()

    var body: some View {
        ZStack {
            ToothTopLeftArea()
                .fill(viewModel.topLeftArea.isBrushed
                      ? viewModel.topLeftArea.color
                      : Color.white)
                .overlay(ToothTopLeftArea()
                    .stroke(Color.gray, lineWidth: 2))

            ToothTopRightArea()
                .fill(viewModel.topRightArea.isBrushed
                      ? viewModel.topRightArea.color
                      : Color.white)
                .overlay(ToothTopRightArea()
                    .stroke(Color.gray, lineWidth: 2))

           

           

            Image(systemName: "paintbrush")
                .resizable()
                .frame(width: 50, height: 50)
                .offset(viewModel.brushPosition)
                .gesture(DragGesture()
                            .onChanged { gesture in
                                viewModel.updateBrushPosition(gesture: gesture)
                            }
                            .onEnded { _ in
                                viewModel.topLeftArea.isBrushed = false
                                viewModel.topRightArea.isBrushed = false
                              
                            }
                )
        }
        .frame(width: 300, height: 400)
        .onAppear {
            viewModel.startAutomaticBrushing()
        }
    }
}



#Preview {
    BrushingToothView2()
}
