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

extension ArticlesList {
    static var all: Resource<ArticlesList> = {
       let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=0f592d1c093f4f56885e639c2b770da5")!
        return Resource(url: url)
    }()
}

struct Article: Decodable {
    let title: String
    let description: String
}
