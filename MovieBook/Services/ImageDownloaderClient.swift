//
//  ImageDownloaderClient.swift
//  MovieBook
//
//  Created by Mehmet Ateş on 30.09.2021.
//

import Foundation

class ImageDownloaderClient : ObservableObject{
    
    @Published var indirilenGorsel : Data?
    func gorselIndir(url: String){
        guard let imageURL = URL(string: url)else{
            return
        }
        URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            DispatchQueue.main.async {
                self.indirilenGorsel = data
            }
            
            
        }.resume()
    }
}
