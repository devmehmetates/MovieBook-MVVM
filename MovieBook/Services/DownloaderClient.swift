//
//  DownloaderClient.swift
//  MovieBook
//
//  Created by Mehmet Ateş on 28.09.2021.
//

import Foundation
import SwiftUI

struct DownloaderClient {
    
    func downloadMovie(searchKey : String , completion : @escaping (Result<[Film]? , DownloaderError>) -> Void){
        
        guard let url = URL (string: "https://www.omdbapi.com/?s=\(searchKey)&apikey=8fcc190a")
        else{
            return completion(.failure(.wrongUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.cantLoad))
            }
            guard let filmCevap = try? JSONDecoder().decode(Gelenler.self, from: data) else{
                return completion(.failure(.cantBuild))
            }
            
            completion(.success(filmCevap.search))

        }.resume()
    }
    
    func downloadDetailMovie(imdbID : String, completion : @escaping (Result<FilmDetay? , DownloaderError>) -> Void){
        guard let url = URL (string: "https://www.omdbapi.com/?i=\(imdbID)&apikey=8fcc190a")
        else{
            return completion(.failure(.wrongUrl))
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data ,error == nil else {
                return completion(.failure(.cantLoad))
            }
            guard let filmDetay = try? JSONDecoder().decode(FilmDetay.self, from: data) else{
                return completion(.failure(.cantBuild))
            }
            
            completion(.success(filmDetay))
            

        }.resume()
    }
}

enum DownloaderError : Error {
    case wrongUrl
    case cantLoad
    case cantBuild
}
