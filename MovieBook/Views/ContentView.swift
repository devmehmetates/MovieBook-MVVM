//
//  ContentView.swift
//  MovieBook
//
//  Created by Mehmet Ateş on 28.09.2021.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var filmlistem : FilmArrayViewModel
    @State var searchMovie = ""
    @State private var isEditing = false
  
    init(){
        self.filmlistem = FilmArrayViewModel()
        self.filmlistem.searchFilm(arama: "")
    }
    var body: some View {
        NavigationView {
            VStack {
                TextField("Enter Movie Name",text:$searchMovie,onEditingChanged: {_ in} ,onCommit: {
                    self.filmlistem.searchFilm(arama: self.searchMovie.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? searchMovie)
                }).padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        self.isEditing = true
                    }
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 15)
                            
                            if isEditing {
                                Button(action: {
                                    self.searchMovie = ""
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.gray)
                                        .padding(.trailing, 15)
                                }
                            }
                        }
                    )
                List(filmlistem.filmler , id: \.imdbID){
                    film in
                    NavigationLink(destination: DetailView(imdbId: film.imdbID)) {
                        VStack{
                            CustomImage(url: film.poster)
                                .frame(height:UIScreen.main.bounds.width * 1.25)
                                .cornerRadius(30.0)
                            Text(film.title)
                                .font(.largeTitle)
                                .multilineTextAlignment(.center)
                            
                            Text(film.year)
                                .font(.subheadline)
                                .foregroundColor(.blue)
                        }
                    }
                }
            }.navigationTitle("Search")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
