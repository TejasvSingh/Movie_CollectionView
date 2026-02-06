//
//  UpdatesTableView.swift
//  Movie_CollectionView
//
//  Created by Tejasv Singh on 2/5/26.
//

import UIKit

class UpdatesTableViewCell: UITableViewCell {
    let descriptionLabel:UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        l.textColor = .black
        l.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        l.numberOfLines = 0
        return l
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(descriptionLabel)
        setUpConstrainst()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setUpConstrainst(){
        NSLayoutConstraint.activate([
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            descriptionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            descriptionLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20)
        ])
    }
    func configure(with movie: Movie) {
        descriptionLabel.text = movie.description
    }
}
