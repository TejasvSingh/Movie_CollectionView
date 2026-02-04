//
//  MovieDetailsViewController.swift
//  Movie_CollectionView
//
//  Created by Tejasv Singh on 2/3/26.
//

import UIKit

class MovieDetailsViewController: UIViewController {

    
    private let movie: Movie

    private let posterImageView = UIImageView()
    private let titleLabel = UILabel()
    private let releaseDateLabel = UILabel()
    private let descriptionLabel = UILabel()


    init(movie: Movie) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

   
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(white: 0.05, alpha: 1)
        setupUI()
        configureData()
    }


    private func setupUI() {

  
        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        posterImageView.contentMode = .scaleAspectFit
        posterImageView.tintColor = .white
        posterImageView.layer.cornerRadius = 12
        posterImageView.clipsToBounds = true
        view.addSubview(posterImageView)

  
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.boldSystemFont(ofSize: 26)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        view.addSubview(titleLabel)


        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        releaseDateLabel.textColor = .lightGray
        releaseDateLabel.textAlignment = .center
        view.addSubview(releaseDateLabel)


        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
        descriptionLabel.numberOfLines = 0
        descriptionLabel.textColor = .white
        descriptionLabel.textAlignment = .justified
        view.addSubview(descriptionLabel)


        NSLayoutConstraint.activate([

            
            posterImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            posterImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            posterImageView.widthAnchor.constraint(equalToConstant: 180),
            posterImageView.heightAnchor.constraint(equalToConstant: 180),

       
            titleLabel.topAnchor.constraint(equalTo: posterImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            
            releaseDateLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            releaseDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            releaseDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            
            descriptionLabel.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            
            descriptionLabel.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }

 
    private func configureData() {
        titleLabel.text = movie.name ?? "Unknown Title"
        releaseDateLabel.text = "Release Date: \(movie.releaseDate ?? "N/A")"
        descriptionLabel.text = movie.description ?? "No description available"

        if let poster = movie.posterImage {
            posterImageView.image = UIImage(systemName: poster)?
                .withRenderingMode(.alwaysTemplate)
        } else {
            posterImageView.image = UIImage(systemName: "film")?
                .withRenderingMode(.alwaysTemplate)
        }
    }
}

