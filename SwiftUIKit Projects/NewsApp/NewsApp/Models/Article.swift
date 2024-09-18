//
//  Article.swift
//  NewsApp
//
//  Created by Seymen Nadir Elmas on 16.09.2024.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
