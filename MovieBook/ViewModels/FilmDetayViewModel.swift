//
//  FilmDetayViewModel.swift
//  MovieBook
//
//  Created by Mehmet Ateş on 1.10.2021.
//

import Foundation
import SwiftUI

class FilmDetayViewModel : ObservableObject {
    @Published var filmDetayi : FilmDetaylariViewModel?
    let downloaderClient = DownloaderClient()
    
    func filmDetayiAl(imdbId: String){
        downloaderClient.downloadDetailMovie(imdbID: imdbId) { (sonuc) in
            switch sonuc{
            case .failure(let hata):
                print(hata)
            case .success(let detayliFilm):
                if let detayliFilm = detayliFilm{
                    DispatchQueue.main.async {
                        self.filmDetayi = FilmDetaylariViewModel(detay: detayliFilm)
                    }
                    
                }
            }
        }
    }
}

struct FilmDetaylariViewModel{
    let detay : FilmDetay
    
    var title : String{
        detay.title
    }
    var poster : String{
        detay.poster
    }
    var imdbId : String{
        detay.imdbID
    }
    var director : String{
        detay.director
    }
    var awards : String{
        detay.awards
    }
    var actors: String{
        detay.actors
    }
    var genre : String{
        detay.genre
    }
    var realesed : String{
        detay.realesed
    }
    var metascore : String {
        detay.metascore
    }
    var imdbRating : String {
        detay.imdbRating
    }
    var plot : String {
        detay.plot
    }
    
}
