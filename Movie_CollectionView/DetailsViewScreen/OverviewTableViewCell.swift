//
//  OverviewTableViewCell.swift
//  Movie_CollectionView
//
//  Created by Tejasv Singh on 2/5/26.
//
import UIKit
class OverViewTableViewCell: UITableViewCell {

    let img: UIImageView = {
        let img = UIImageView()
        img.translatesAutoresizingMaskIntoConstraints = false
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 25
        img.layer.masksToBounds = true
        return img
    }()

    let title: UILabel = {
        let l = UILabel()
        l.font = UIFont.systemFont(ofSize: 24)
        l.numberOfLines = 0
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    let getButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.layer.cornerRadius = 17.5
        btn.backgroundColor = .systemBlue
        btn.setTitle("Download", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return btn
    }()

    let moreBtn: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setBackgroundImage(UIImage(systemName: "ellipsis.circle.fill"), for: .normal)
        return btn
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(img)
        contentView.addSubview(title)
        contentView.addSubview(getButton)
        contentView.addSubview(moreBtn)

        NSLayoutConstraint.activate([
            img.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            img.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            img.widthAnchor.constraint(equalToConstant: 120),
            img.heightAnchor.constraint(equalToConstant: 120),

            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            title.leadingAnchor.constraint(equalTo: img.trailingAnchor, constant: 20),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),

            getButton.leadingAnchor.constraint(equalTo: img.trailingAnchor, constant: 20),
            getButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            getButton.widthAnchor.constraint(equalToConstant: 80),
            getButton.heightAnchor.constraint(equalToConstant: 35),

            moreBtn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            moreBtn.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            moreBtn.widthAnchor.constraint(equalToConstant: 35),
            moreBtn.heightAnchor.constraint(equalToConstant: 35)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with movie: Movie) {
        title.text = movie.name
        if let poster = movie.posterImage {
            img.image = UIImage(systemName: poster)
        } else {
            img.image = UIImage(systemName: "film")
        }
    }
}
