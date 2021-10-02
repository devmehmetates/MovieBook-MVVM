//
//  CustomImage.swift
//  MovieBook
//
//  Created by Mehmet Ateş on 30.09.2021.
//

import SwiftUI

struct CustomImage: View {
    
    let url : String
    @ObservedObject var imageDownloaderClient = ImageDownloaderClient()
    
    init(url : String){
        self.url = url
        self.imageDownloaderClient.gorselIndir(url: self.url)
    }
    
    var body: some View {
        if let data = self.imageDownloaderClient.indirilenGorsel{
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
            
        }else{
            return Image(systemName: "star.fill")
                
        }
    }
}

struct CustomImage_Previews: PreviewProvider {
    static var previews: some View {
        CustomImage(url: "https://www.arkabahce.com.tr/image/cache/data/yerli/deadpool-deadpoolu-olduruyor-1200x1200.jpg")
    }
}
