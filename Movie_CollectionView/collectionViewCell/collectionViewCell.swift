//
//  collextionViewCell.swift
//  Movie_CollectionView
//
//  Created by Tejasv Singh on 2/3/26.
//
import UIKit

class HomeVCollectionViewCell: UICollectionViewCell {

    private let posterImage = UIImageView()
    private let titleLabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {

        contentView.layer.cornerRadius = 10

        contentView.backgroundColor = UIColor(white: 0.18, alpha: 1)
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shadowOffset = CGSize(width: 0, height: 3)
        

     
        posterImage.translatesAutoresizingMaskIntoConstraints = false
        posterImage.tintColor = .systemYellow 
        posterImage.contentMode = .scaleAspectFit
        posterImage.tintColor = .white
        posterImage.clipsToBounds = true

       
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center

        contentView.addSubview(posterImage)
        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([

            posterImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            posterImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posterImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            posterImage.heightAnchor.constraint(equalToConstant: 140),

            titleLabel.topAnchor.constraint(equalTo: posterImage.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }

    func setData(movie: Movie) {
        titleLabel.text = movie.title ?? ""
        let base = "https://image.tmdb.org/t/p/w500"
        let full = base + (movie.posterImage ?? "")
        
        Task {
            await posterImage.loadImage(url: full)
        }
    }
}
