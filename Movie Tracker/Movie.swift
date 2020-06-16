//
//  MovieDetail.swift
//  Movie Tracker
//
//  Created by Bruno Alves da Silva on 13/06/20.
//  Copyright © 2020 Bruno Alves da Silva. All rights reserved.
//

import Foundation

struct Movie: Identifiable {
    var id = UUID()
    var title = ""
    var rating = 3.0
    var seen = false
}

class MovieStorage: ObservableObject {
    @Published var movies = [Movie]()
}
