//
//  MoviesItemView.swift
//  final_project
//
//  Created by Jackson on 23/06/23.
//

import Foundation
import UIKit
import SwiftyGif

class MoviesItemViewCell: UITableViewCell {
    
    let mediumSpacingValue: CGFloat = 16.0
    let rate: CGFloat
    
    lazy var containerStack: UIStackView = {
        let view = UIStackView()
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 5
        view.axis = .horizontal
        return view
    }()
    
    lazy var leadingStack: UIStackView = {
        let view = UIStackView()
        view.alignment = .leading
        view.distribution = .fill
        view.axis = .vertical
        return view
    }()
    
    lazy var trailingStack: UIStackView = {
        let view = UIStackView()
        view.alignment = .leading
        view.distribution = .fillProportionally
        view.axis = .vertical
        return view
    }()
    
    lazy var title: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    lazy var imageContainer: UIImageView = {
        let gif = try! UIImage(gifName: "skeleton.gif")
        let view = UIImageView(gifImage: gif)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    lazy var average: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.textAlignment = .left
        return label
    }()
    
    lazy var moreInfoLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.text = "mais detalhes"
        return label
    }()
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(style: UITableViewCell.CellStyle = .default, reuseIdentifier: String?, imageURL: String, title: String, rate: CGFloat) {
        self.rate = rate
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.average.text = "Média: \(rate)"
        self.title.text = "Título: \(title)"
        fetchImage(imageURL: imageURL)
        setupViews()
        setupConstraints()
        setupBounds()
    }
    
    private func  fetchImage(imageURL: String) {
        let url = URL(string: imageURL)
        URLSession(configuration: .default).dataTask(with: url!) { data,response,_  in
            DispatchQueue.main.async {
                let dataImage = UIImage(data: data!)
                self.imageContainer.setImage(dataImage!)
            }
        }.resume()
    }
}

extension MoviesItemViewCell {
    private func setupViews() {
        addSubview(containerStack)
        containerStack.addArrangedSubview(leadingStack)
        containerStack.addArrangedSubview(trailingStack)
        leadingStack.addArrangedSubview(imageContainer)
        trailingStack.addArrangedSubview(title)
        trailingStack.addArrangedSubview(average)
        trailingStack.addArrangedSubview(moreInfoLabel)
    }
    
    private func setupBounds() {
        self.backgroundColor = UIColor(red: 250, green: 237, blue: 205, alpha: 0.5)
        self.layer.cornerRadius = 5
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.black.cgColor
//        self.layer.frame = layer.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    private func setupConstraints() {
        self.containerStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.containerStack.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            self.containerStack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            self.containerStack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            self.containerStack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
    }
}
