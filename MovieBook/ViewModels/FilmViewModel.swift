//
//  FilmViewModel.swift
//  MovieBook
//
//  Created by Mehmet Ateş on 29.09.2021.
//

import Foundation
import SwiftUI

class FilmArrayViewModel : ObservableObject {
    let downloaderClient = DownloaderClient()
    @Published var filmler = [FilmViewModel]()
    func searchFilm(arama : String) {
        downloaderClient.downloadMovie(searchKey: arama) { (sonuc) in
            switch sonuc{
            case .failure(let hata):
                print(hata);
            case .success(let filmDizisi):
                if let filmDizisi = filmDizisi{
                    DispatchQueue.main.async {
                        self.filmler = filmDizisi.map(FilmViewModel.init)
                    }
                    
                }
            }
        }
    }
}

struct FilmViewModel{
    let film : Film
    
    var title : String{
        film.title
    }
    var poster : String{
        film.poster
    }
    var year : String {
        film.year
    }
    var imdbID : String{
        film.imdbID
    }
    
}
