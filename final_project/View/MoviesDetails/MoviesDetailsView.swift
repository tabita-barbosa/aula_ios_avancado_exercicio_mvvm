//
//  MoviesDetailsView.swift
//  final_project
//
//  Created by Tabita Barbosa on 13/07/23.
//

import Foundation
import UIKit
import SwiftyGif

final class MoviesDetailsView: UIView {
    
    lazy var stackContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 8
        view.distribution = .fill
        return view
    }()
    
    lazy var mainTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.numberOfLines = .zero
        return label
    }()
    
    lazy var releaseDate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        label.numberOfLines = .zero
        return label
    }()
    
    lazy var duration: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        label.numberOfLines = .zero
        return label
    }()
    
    lazy var movieGenre: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        label.numberOfLines = .zero
        return label
    }()
    
    lazy var voteRate: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        label.numberOfLines = .zero
        return label
    }()
    
    lazy var movieResume: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .left
        label.numberOfLines = .zero
        return label
    }()
    
    lazy var spinner: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.style = .large
        view.translatesAutoresizingMaskIntoConstraints = false
        view.startAnimating()
        return view
        
    }()
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .white
        self.setupView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(title: String, releaseDate: String, duration: String, genre: String, rate: String, resume: String ) {
        self.mainTitle.text = title
        self.releaseDate.text = releaseDate
        self.duration.text = duration
        self.movieGenre.text = genre
        self.voteRate.text = rate
        self.movieResume.text = resume
    }
    
    func showLoading() {
        addSubview(spinner)
        
        spinner.heightAnchor.constraint(equalToConstant: 200).isActive = true
        spinner.widthAnchor.constraint(equalToConstant: 200).isActive = true
        spinner.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            self.spinner.removeFromSuperview()
        }
    }
}

extension MoviesDetailsView {
    
    func setupView() {
        self.setupHierarchy()
        self.setupConstraints()
    }
    
    func setupHierarchy() {
        addSubview(self.stackContainer)
        stackContainer.addArrangedSubview(self.mainTitle)
        stackContainer.addArrangedSubview(self.releaseDate)
        stackContainer.addArrangedSubview(self.duration)
        stackContainer.addArrangedSubview(self.movieGenre)
        stackContainer.addArrangedSubview(self.voteRate)
        stackContainer.addArrangedSubview(self.movieResume)
    }
    
    func setupConstraints() {
        stackContainer.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackContainer.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            stackContainer.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackContainer.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
        
    }
}
