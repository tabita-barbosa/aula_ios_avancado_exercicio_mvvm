//
//  ViewController.swift
//  final_project
//
//  Created by Jackson on 11/08/22.
//

import UIKit

// MARK: - Main Class

class MoviesListController: UIViewController, Coordinating {
    
    var coordinator: Coordinator?
    
    private var tableView: UITableView = {
        let table =  UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    private var viewModel: MoviesViewModel!
    
    // BIND GET SETUP
    private var data: [Movies] {
        return viewModel.model.movies
    }
    
    // MARK: - Initialize
    
    override func viewDidLoad() {
        self.view.backgroundColor = .white
        navigationItem.title = "lista de filmes"
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        super.viewDidLoad()
        
        self.view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        setupContraints()
        
        bindSetup()
        viewModel.getMovies()
    }
    
    // MARK: - Private Functions
    
    private func bindSetup() {
        viewModel = MoviesViewModel(movies: MoviesModel(), service: MoviesService())
        viewModel.reloadTable = self.reloadTable
    }
    
    private func didTapCell(position: IndexPath) {
        let id = String(data[position.section].id)
        
        coordinator?.navigate(to: .moviesDetails, data: id)
    }
    
    // MARK: - Public Functions
    
    func reloadTable() -> Void {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

extension MoviesListController {
    private func setupContraints() {
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20).isActive = true
    }
}

extension MoviesListController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let tmdbImagePath = "https://image.tmdb.org/t/p/original"
        let currentMovie = data[indexPath.section]
        
        let cell = MoviesItemViewCell(reuseIdentifier: "moviesCell",
                                      imageURL: tmdbImagePath + currentMovie.posterPath,
                                      title: currentMovie.originalTitle,
                                      rate: currentMovie.voteAverage)
        
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        didTapCell(position: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 8
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView()
        v.backgroundColor = .white
        return v
    }
}
