//
//  MovieListViewModel.swift
//  MoviesApp
//
//  Created by Seymen Nadir Elmas on 11.09.2024.
//
import Foundation
import SwiftUI

class MovieListViewModel: ObservableObject {
    
    @Published var movies = [MovieViewModel]()
    let httpClient = HTTPClient()
    
    func searchByName(_ name: String) {
        
        httpClient.getMoviesBy(search: name) { result in
            switch result {
            case .success(let movies):
                if let movies = movies {
                    DispatchQueue.main.async {
                        self.movies = movies.map(MovieViewModel.init)
                    }
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

struct MovieViewModel {
    
    let movie: Movie
    
    var imdbId: String {
        movie.imdbID
    }
    
    var title: String {
        movie.title
    }
    
    var poster: String {
        movie.poster
    }
    
    var year: String {
        movie.year
    }
    
}
