//
//  Article.swift
//  GoodNews
//
//  Created by Ezequiel Parada Beltran on 05/12/2020.
//

import Foundation

struct ArticlesList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
