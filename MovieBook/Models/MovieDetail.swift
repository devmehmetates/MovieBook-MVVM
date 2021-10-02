//
//  MovieDetail.swift
//  MovieBook
//
//  Created by Mehmet Ateş on 30.09.2021.
//

import Foundation

struct FilmDetay :  Codable{
    let title : String
    let realesed : String
    let genre : String
    let director : String
    let actors : String
    let plot : String
    let awards: String
    let poster : String
    let metascore : String
    let imdbRating : String
    let imdbID : String
    
    private enum CodingKeys : String ,CodingKey{
        case title = "Title"
        case realesed = "Released"
        case genre  = "Genre"
        case director = "Director"
        case actors = "Actors"
        case plot = "Plot"
        case awards = "Awards"
        case poster = "Poster"
        case metascore = "Metascore"
        case imdbRating = "imdbRating"
        case imdbID = "imdbID"
    }
}
