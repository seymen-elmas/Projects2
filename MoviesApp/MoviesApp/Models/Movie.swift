//
//  Movie.swift
//  MoviesApp
//
//  Created by Seymen Nadir Elmas on 9.09.2024.
//

import Foundation

struct MovieResponse : Codable {
    let movies : [Movie]
    private enum codingKeys : String ,CodingKey {
        case movies = "Search"
    }
}

struct Movie:Codable {
    let title : String
    let year : String
    let imdbID : String
    let poster : String
    private enum CodingKeys : String ,CodingKey {
        case title = "title"
        case year = "year"
        case imdbID = "imdbID"
        case poster = "poster"
    }
    
}
