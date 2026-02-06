//
//  tableView.swift
//  Movie_CollectionView
//
//  Created by Tejasv Singh on 2/5/26.
//

import UIKit
class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //var movies: [Movie] = []
    private let movie: Movie
    init(movie: Movie) {
           self.movie = movie
           super.init(nibName: nil, bundle: nil)
       }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.delegate = self
        tv.dataSource = self
        tv.register(OverViewTableViewCell.self, forCellReuseIdentifier: "OverviewTableViewCell")
        tv.register(RatingsTableViewCell.self, forCellReuseIdentifier: "RatingsTableViewCell")
        tv.register(UpdatesTableViewCell.self, forCellReuseIdentifier: "UpdatesTableViewCell")
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 160
        return tv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row==0{
            let cell = tableView.dequeueReusableCell(
                withIdentifier: "OverviewTableViewCell",
                for: indexPath
            ) as! OverViewTableViewCell
            
            // let movie = movies[indexPath.row]
            cell.configure(with: movie)
            return cell
        }
        if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "RatingsTableViewCell", for: indexPath) as! RatingsTableViewCell
            cell.backgroundColor = .white
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            return cell
        }
        if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "UpdatesTableViewCell", for: indexPath) as! UpdatesTableViewCell
            cell.backgroundColor = .white
            cell.selectionStyle = .none
            cell.separatorInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            cell.configure(with: movie)
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 160
        }
        if indexPath.row == 1 {
            return 75
        }
        if indexPath.row == 2 {
            return 280
        }
        return CGFloat()
    }
}
