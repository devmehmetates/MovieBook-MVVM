//
//  Movie.swift
//  MovieBook
//
//  Created by Mehmet Ateş on 28.09.2021.
//

import Foundation
// mykEY = 8fcc190a

struct Film : Codable {
    let title : String
    let year : String
    let imdbID : String
    let type : String
    let poster : String
    
    private enum CodingKeys : String , CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}

struct Gelenler : Codable {
    var search : [Film]
    
    private enum CodingKeys : String , CodingKey {
        case search = "Search"
    }
}
