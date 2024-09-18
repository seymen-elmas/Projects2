//
//  MovieListScreen.swift
//  MoviesApp
//
//  Created by Seymen Nadir Elmas on 11.09.2024.
//

import SwiftUI

struct MovieListScreen: View {
    
    @ObservedObject private var movieListVM: MovieListViewModel
    
    init() {
        self.movieListVM = MovieListViewModel()
        self.movieListVM.searchByName("batman")
    }
    
    var body: some View {
        VStack {
            MovieListView(movies: self.movieListVM.movies)
            .navigationBarTitle("Movies")
        }.embedNavigationView()
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieListScreen()
    }
}
