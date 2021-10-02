//
//  DetailView.swift
//  MovieBook
//
//  Created by Mehmet Ateş on 1.10.2021.
//

import SwiftUI

struct DetailView: View {
    var imdbId : String
    @ObservedObject var filmdetay = FilmDetayViewModel()
    var screenSize =  UIScreen.main.bounds
    
    var body: some View {
        ScrollView{
            HStack() {
                Text(filmdetay.filmDetayi?.title ?? "name")
                    .font(.largeTitle)
                .bold()
                Spacer()
            }
            .padding(.leading)
            
            CustomImage(url: filmdetay.filmDetayi?.poster ?? "")
                .frame(
                    width: screenSize.width * 0.9, height: screenSize.width * 1.3, alignment: .center)
                .cornerRadius(25.0)
                .shadow(radius: 20)
            VStack(alignment:.leading) {
                Section {
                    Text("About Movie")
                    Text(filmdetay.filmDetayi?.plot ?? "Film kanka")
                        .lineLimit(4)
                        .foregroundColor(.accentColor)
                        .padding(.bottom)
                }
                Section {
                    Text("Date: ")
                    Text(filmdetay.filmDetayi?.realesed ?? "Tarih")
                        .foregroundColor(.gray)
                        .padding(.bottom)
                }
                Section{
                    Text("Awards: ")
                    Text(filmdetay.filmDetayi?.awards ?? "Ödüller")
                        .foregroundColor(.orange)
                        .padding(.bottom)
                }
                Section{
                    Text("IMDB Rating: ")
                    Text(filmdetay.filmDetayi?.imdbRating ?? "imdbScore")
                        .foregroundColor(Double(filmdetay.filmDetayi?.imdbRating ?? "") ?? 0 > 6 ? .green : .red)
                        .padding(.bottom)
                    
                }
            }.padding()
            
            
            
        }.onAppear {
            self.filmdetay.filmDetayiAl(imdbId: imdbId)
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(imdbId: "tt0120338")
    }
}
