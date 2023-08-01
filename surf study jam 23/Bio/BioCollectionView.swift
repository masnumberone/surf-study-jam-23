//
//  BioCellView.swift
//  surf study jam 23
//
//  Created by work on 01.08.2023.
//

import UIKit

class BioCellView: UICollectionViewCell {
    
    static let identifier = "BioCellView"
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.192, green: 0.192, blue: 0.192, alpha: 1)
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.text = "О себе"
       
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let bioLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.192, green: 0.192, blue: 0.192, alpha: 1)
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleLabel)
        contentView.addSubview(bioLabel)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            bioLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            bioLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            bioLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            bioLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with text: String) {
        bioLabel.text = text
        layoutSubviews()
    }
    
    

}

