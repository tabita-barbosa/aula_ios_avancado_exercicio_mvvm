//
//  ViewControllerModel.swift
//  final_project
//
//  Created by Jackson on 11/08/22.
//

import Foundation

protocol MoviesModelType {
    var movies: [Movies] { get set }
    
    func setMovies(response: Data?)
}


class MoviesModel: MoviesModelType {
    var movies: [Movies] = []
    
    func setMovies(response: Data?) {
        guard let response = response else { return }
        
        let responseData = try? JSONDecoder().decode(MoviesTopRated.self, from: response)
        
        var movies = responseData?.results
        movies?.sort(by: { $0.popularity > $1.popularity })
        
        self.movies = movies!
    }
}
