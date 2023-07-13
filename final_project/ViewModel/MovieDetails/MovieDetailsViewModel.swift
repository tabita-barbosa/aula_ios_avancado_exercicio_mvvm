//
//  MovieDetails.swift
//  final_project
//
//  Created by Jackson on 16/08/22.
//

import Foundation

class MovieDetailsViewModel {
    var movie: MovieDetails?
    var service: MoviesServiceType
    
    var showLoading: (() -> Void)?
    var hideLoading: (() -> Void)?
    
    var updateMovieDetails: (() -> Void)?
    
    init(service: MoviesServiceType) {
        self.service = service
    }
    
    func fetchMovie(movieId: String) {
        showLoading?() //startLoading
        service.getDetails(movieId: movieId, completion: { [weak self] data, error in
            let responseData = try? JSONDecoder().decode(MovieDetails.self, from: data!)
            self?.movie = responseData
            self?.updateMovieDetails?()
            self?.hideLoading?() // hideLoading
        })
    }
}
