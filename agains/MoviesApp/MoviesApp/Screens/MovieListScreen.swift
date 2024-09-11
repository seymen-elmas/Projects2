//
//  MovieListScreen.swift
//  MoviesApp
//
//  Created by Seymen Nadir Elmas on 11.09.2024.
//

import SwiftUI

struct MovieListScreen: View {
    
    @ObservedObject private var modelListVm: MovieListViewModel
    @State private var MovieName : String = ""
    init() {
        self.modelListVm = MovieListViewModel()
        
    }
    var body: some View {
        VStack{
            TextField("Search", text: $MovieName, onEditingChanged: { _ in},onCommit: {
                self.modelListVm.searchByName(MovieName)
            }).textFieldStyle(RoundedBorderTextFieldStyle())
            Spacer()
                .navigationBarTitle("Movies")
    if self.modelListVm.loadingState == .success{
        MovieListView(movies: self.modelListVm.movies)
    } else if self.modelListVm.loadingState == .failed{
        FailedView()
    } else if self.modelListVm.loadingState == .loading{
        LoadingView()
    }
            
        }.embedNavigationView()
    }
}

#Preview {
    MovieListScreen()
}
