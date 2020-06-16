//
//  MovieDetail.swift
//  Movie Tracker
//
//  Created by Bruno Alves da Silva on 13/06/20.
//  Copyright © 2020 Bruno Alves da Silva. All rights reserved.
//

import SwiftUI

struct MovieDetail: View {
    
    @State var movie: Movie
    @Environment(\.presentationMode) var presentationMode
    let newMovie : Bool
    @EnvironmentObject var movieStorage : MovieStorage
    
    var body: some View {
        List {
            Section {
                SectionTitle(title: "Titulo")
                TextField("Titulo do Filme", text:$movie.title)
            }
            Section {
                SectionTitle(title: "Avaliacao")
                HStack {
                   Spacer()
                    Text(String(repeating: "★", count: Int(movie.rating))).foregroundColor(.yellow).font(.title)
                    Spacer()
                }
                Slider(value: $movie.rating, in: 1...5, step: 1)
            }
            Section {
                SectionTitle(title: "Visto")
                Toggle(isOn: $movie.seen) {
                    
                    if movie.title == "" {
                       Text("Eu assisti esse filme")
                    } else {
                        Text("Eu assisti \(movie.title)")
                    }
                }
            }
            Section {
                Button(action:{
                    if self.newMovie {
                        self.movieStorage.movies.append(self.movie)
                    } else {
                        for x in 0..<self.movieStorage.movies.count {
                            if self.movieStorage.movies[x].id == self.movie.id {
                                self.movieStorage.movies[x] = self.movie
                            }
                        }
                    }
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    HStack {
                        Spacer()
                        Text("Salvar")
                        Spacer()
                    }
                }.disabled(movie.title.isEmpty)
            }
        }.listStyle(GroupedListStyle())
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetail(movie: Movie(), newMovie: true)
    }
}

struct SectionTitle: View {
    
    var title : String
    
    var body: some View {
        Text(title).font(.caption).foregroundColor(.green)
    }
}
