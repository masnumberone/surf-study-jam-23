//
//  HeaderSkillCellView.swift
//  surf study jam 23
//
//  Created by work on 01.08.2023.
//

import UIKit

class HeaderSkillCellView: UICollectionViewCell {
    static let identifier = "HeaderSkillCellView"
    var onTapButton: (() -> Void)?
    
    private let label: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.192, green: 0.192, blue: 0.192, alpha: 1)
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.text = "Мои навыки"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageView: UIImageView = {
        let image = UIImage(named: "pencil")
        let imageView = UIImageView(image: image!)
        
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(label)
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 24),
            imageView.heightAnchor.constraint(equalToConstant: 24)
        ])
        
        imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageViewDidTapped)))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc
    func imageViewDidTapped() {
        onTapButton?()
    }
    
}
