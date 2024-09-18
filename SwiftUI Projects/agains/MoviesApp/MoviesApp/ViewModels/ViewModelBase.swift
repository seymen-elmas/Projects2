//
//  ViewModelBase.swift
//  MoviesApp
//
//  Created by Seymen Nadir Elmas on 11.09.2024.
//

import Foundation
import SwiftUI

enum LoadingState {
    case loading, success, failed, none
}

class ViewModelBase: ObservableObject {
    @Published var loadingState: LoadingState = .none
}
