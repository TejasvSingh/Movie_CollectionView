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

      
        contentView.backgroundColor = UIColor(white: 0.18, alpha: 1)
        contentView.layer.cornerRadius = 14
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOpacity = 0.3
        contentView.layer.shadowRadius = 6
        contentView.layer.shadowOffset = CGSize(width: 0, height: 3)
        contentView.clipsToBounds = false

     
        posterImage.translatesAutoresizingMaskIntoConstraints = false
        posterImage.tintColor = .systemYellow 
        posterImage.contentMode = .scaleAspectFit
        posterImage.tintColor = .white
        posterImage.layer.cornerRadius = 10
        posterImage.clipsToBounds = true

       
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center

        contentView.addSubview(posterImage)
        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([

            posterImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            posterImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            posterImage.heightAnchor.constraint(equalToConstant: 90),
            posterImage.widthAnchor.constraint(equalToConstant: 90),

            titleLabel.topAnchor.constraint(equalTo: posterImage.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }

    func setData(movie: Movie) {
        titleLabel.text = movie.name ?? ""
        posterImage.image = UIImage(systemName: movie.posterImage ?? "")?
            .withRenderingMode(.alwaysTemplate)
    }
}
