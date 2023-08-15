//
//  ProfileCellView.swift
//  surf study jam 23
//
//  Created by work on 01.08.2023.
//

import UIKit

class ProfileCellView: UICollectionViewCell {
    static let identifier = "ProfileCellView"
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 60
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.192, green: 0.192, blue: 0.192, alpha: 1)
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.numberOfLines = 2
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let mottoLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.588, green: 0.584, blue: 0.608, alpha: 1)
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 2
        label.textAlignment = .center
       
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.588, green: 0.584, blue: 0.608, alpha: 1)
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 1
        label.textAlignment = .center
       
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let locationImageView: UIImageView = {
        let image = UIImage(named: "locationPoint")!
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = false
        backgroundView = UIView()
        backgroundView!.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
        backgroundView!.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(backgroundView!)
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(mottoLabel)
        contentView.addSubview(locationLabel)
        contentView.addSubview(locationImageView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView!.topAnchor.constraint(equalTo: topAnchor, constant: -1000),
            backgroundView!.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -16),
            backgroundView!.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
            backgroundView!.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 19),
            
            imageView.widthAnchor.constraint(equalToConstant: 120),
            imageView.heightAnchor.constraint(equalToConstant: 120),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            
            nameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            nameLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            nameLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
            nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            
            mottoLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            mottoLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            mottoLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
            mottoLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            
            locationLabel.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 7),
            locationLabel.topAnchor.constraint(equalTo: mottoLabel.bottomAnchor),
            
            locationImageView.centerYAnchor.constraint(equalTo: locationLabel.centerYAnchor),
            locationImageView.trailingAnchor.constraint(equalTo: locationLabel.leadingAnchor, constant: -2),
            locationImageView.heightAnchor.constraint(equalToConstant: 14),
            locationImageView.widthAnchor.constraint(equalToConstant: 14),
            
            locationImageView.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor),
            locationImageView.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
            
            bottomAnchor.constraint(equalTo: locationLabel.bottomAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with profile: Profile) {
        imageView.image = profile.image
        nameLabel.text = profile.name
        mottoLabel.text = profile.motto
        locationLabel.text = profile.location
    }
    
}
