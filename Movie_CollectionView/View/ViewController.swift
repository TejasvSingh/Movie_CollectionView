//
//  ViewController.swift
//  Movie_CollectionView
//
//  Created by Tejasv Singh on 2/3/26.
//

import UIKit

import UIKit

class ViewController: UIViewController,
                      UICollectionViewDataSource,
                      UICollectionViewDelegate {

    private var movieCollectionView: UICollectionView!
    private let titleLabel = UILabel()
    private let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(white: 0.05, alpha: 1)
        viewModel.loadMovies()
        setupUI()
    }

    private func setupUI() {

        // Title
        titleLabel.text = "Popular Movies"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        // Layout
        let layout = UICollectionViewFlowLayout()

        let spacing: CGFloat = 14
        let itemsPerRow: CGFloat = 2

        let totalSpacing = (itemsPerRow + 1) * spacing
        let itemWidth = (view.frame.width - totalSpacing) / itemsPerRow

        layout.itemSize = CGSize(width: itemWidth, height: 220)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.sectionInset = UIEdgeInsets(top: spacing,
                                           left: spacing,
                                           bottom: spacing,
                                           right: spacing)

        // CollectionView
        movieCollectionView = UICollectionView(frame: .zero,
                                               collectionViewLayout: layout)
        movieCollectionView.backgroundColor = .clear
        movieCollectionView.translatesAutoresizingMaskIntoConstraints = false
        movieCollectionView.dataSource = self
        movieCollectionView.delegate = self
        movieCollectionView.showsVerticalScrollIndicator = false
        movieCollectionView.register(HomeVCollectionViewCell.self,
                                      forCellWithReuseIdentifier: "homeTableViewCell")

        view.addSubview(titleLabel)
        view.addSubview(movieCollectionView)

        NSLayoutConstraint.activate([

            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),

            movieCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
            movieCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            movieCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            movieCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

    // MARK: DataSource

    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfMovies()
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "homeTableViewCell",
            for: indexPath
        ) as! HomeVCollectionViewCell

        cell.setData(movie: viewModel.movie(at: indexPath.row))
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = viewModel.movie(at: indexPath.row)
        let detailsVC = MovieDetailsViewController(movie: movie)
        navigationController?.pushViewController(detailsVC, animated: true)
    }

}
