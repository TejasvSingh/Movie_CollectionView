//
//  ViewController.swift
//  Movie_CollectionView
//
//  Created by Tejasv Singh on 2/3/26.
//

import UIKit



class ViewController: UIViewController,
                      UICollectionViewDataSource,
                      UICollectionViewDelegate, UISearchResultsUpdating {
    
    private var movieCollectionView: UICollectionView!
    private let titleLabel = UILabel()
    var viewModel: HomeViewModelProtocol?
    let searchController = UISearchController(searchResultsController: nil)
    var filteredMovies : [Movie] = []
    var isSearching = false
    
    
    init(viewModel: HomeViewModelProtocol?) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 0.05, alpha: 1)
        setupUI()
        setUpSearchBar()
        
        Task {
            await viewModel?.getDataFromServer()
            print("Movies count:", viewModel?.numberOfMovies() ?? -1)
            print("Data fetched successfully")
            await MainActor.run {
                self.movieCollectionView.reloadData()
            }
        }
        
        
    }
    
    private func setupUI() {
        
        
        titleLabel.text = "Popular Movies"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 28, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        
        let layout = UICollectionViewFlowLayout()
        
        let spacing: CGFloat = 5
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
        let searchText = searchController.searchBar.text ?? ""
        if searchText.isEmpty {
           return viewModel?.numberOfMovies() ?? 0
        }
        return filteredMovies.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "homeTableViewCell",
            for: indexPath
        ) as! HomeVCollectionViewCell
        let searchText = searchController.searchBar.text ?? ""
        if searchText.isEmpty {
            if let movie = viewModel?.movie(at: indexPath.row) {
                cell.setData(movie: movie)
            }
        }
        else{
            let movie = filteredMovies[indexPath.row]
            cell.setData(movie: movie)
        }
        
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let movie = viewModel?.movie(at: indexPath.row){
            let detailsVC = HomeViewController(movie: movie)
            navigationController?.pushViewController(detailsVC, animated: true)
        }
        
    }
    func setUpSearchBar(){
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.setNavigationBarHidden(false, animated: false)
        definesPresentationContext = true
    }
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text ?? ""
        isSearching = true
        filteredMovies = viewModel?.searchMovies(by: searchText) ?? []
        movieCollectionView.reloadData()
    }
}
