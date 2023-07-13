//
//  MoviesDetailsController.swift
//  final_project
//
//  Created by Jackson on 16/08/22.
//

import Foundation
import UIKit

class MovieDetailsController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    var viewModel: MovieDetailsViewModel?
    var movieId: String
        
    var movie: MovieDetails? {
        return viewModel?.movie
    }
    
    init(movieId: String) {
        self.movieId = movieId
        super.init(nibName: nil, bundle: nil)
        super.viewDidLoad()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        navigationItem.title = "detalhes do filme"
        
        bindSetup()
        
        viewModel?.fetchMovie(movieId: movieId)
    }
    
    func bindSetup() {
        viewModel = MovieDetailsViewModel(service: MoviesService())
        viewModel?.updateMovieDetails = updateScreen
        
        viewModel?.showLoading = self.detailsView.showLoading
        viewModel?.hideLoading = self.detailsView.hideLoading
        
        self.view = detailsView
    }
    
    func updateScreen() {
        DispatchQueue.main.async { [weak self] in
            guard let genre = self?.viewModel?.movie?.genres?[1].name else { return }
            self?.detailsView.updateView(title: "Título: \(self?.viewModel?.movie?.title ?? "")",
                                         releaseDate: "Data de lançamento: \(String(self?.viewModel?.movie?.releaseDate ?? ""))",
                                         duration: "Duração: \(String(self?.viewModel?.movie?.runtime ?? 0)) minutos",
                                         genre: "Genero: \(genre)",
                                         rate: "Nota: \(String(self?.viewModel?.movie?.voteAverage ?? 0.0))",
                                         resume: "Resumo: \(String(self?.viewModel?.movie?.overview ?? ""))")
        }
    }
    
    lazy var detailsView: MoviesDetailsView = {
        let view = MoviesDetailsView()
        view.backgroundColor = .white
        return view
    }()
}
