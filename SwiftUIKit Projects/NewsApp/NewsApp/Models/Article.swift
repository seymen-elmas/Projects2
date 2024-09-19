//
//  Article.swift
//  NewsApp
//
//  Created by Seymen Nadir Elmas on 16.09.2024.
//

import Foundation

struct ArticleList: Codable {
    let articles: [Article]
}

struct Article: Codable {
    let title: String
    let description: String
}

