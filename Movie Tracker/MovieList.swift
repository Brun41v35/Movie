//
//  MovieDetail.swift
//  Movie Tracker
//
//  Created by Bruno Alves da Silva on 13/06/20.
//  Copyright © 2020 Bruno Alves da Silva. All rights reserved.
//

import SwiftUI

struct MovieList: View {
    
    @EnvironmentObject var movieStorage : MovieStorage
    
    var body: some View {
        NavigationView {
            List(movieStorage.movies) { currentMovie in
                NavigationLink(destination: MovieDetail(movie: currentMovie, newMovie: false)) {
                    Text(currentMovie.title)
                }
                }.navigationBarTitle("Filmes").navigationBarItems(trailing:
                    NavigationLink(destination: MovieDetail(movie: Movie(), newMovie: true)) {
                        Image(systemName: "plus")
                    }
                )
        }
    }
}

struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}
