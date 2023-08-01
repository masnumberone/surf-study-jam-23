//
//  SkillCellView.swift
//  surf study jam 23
//
//  Created by work on 01.08.2023.
//

import UIKit

class SkillCellView: UICollectionViewCell {
    static let identifier = "SkillCellView"
    private var isCellForAdd = false
    private var skill: Skill!
    var delegate: ResumeViewControllerDelegate!
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.192, green: 0.192, blue: 0.192, alpha: 1)
        label.font = .systemFont(ofSize: 14, weight: .regular)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let crossImageView: UIImageView = {
        let image = UIImage(named: "cross")
        let imageView = UIImageView(image: image!)
        
        imageView.isUserInteractionEnabled = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var crossTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(crossImageDidTapped))
    private lazy var plusTapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(plusLabelDidTapped))
    
    lazy private var commonConstraint = [
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
        
        contentView.widthAnchor.constraint(lessThanOrEqualToConstant: 350),
        
        contentView.trailingAnchor.constraint(equalTo: label.trailingAnchor, constant: 24),
        contentView.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: 12),
        
        topAnchor.constraint(equalTo: contentView.topAnchor),
        leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ]
    
    lazy private var editingSkillsConstraint = [
        label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
        
        contentView.widthAnchor.constraint(lessThanOrEqualToConstant: 350),
        
        crossImageView.centerYAnchor.constraint(equalTo: label.centerYAnchor),
        crossImageView.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 10),
        crossImageView.widthAnchor.constraint(equalToConstant: 14),
        crossImageView.heightAnchor.constraint(equalToConstant: 14),
        
        contentView.trailingAnchor.constraint(equalTo: crossImageView.trailingAnchor, constant: 24),
        contentView.bottomAnchor.constraint(equalTo: label.bottomAnchor, constant: 12),
        
        topAnchor.constraint(equalTo: contentView.topAnchor),
        leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        crossImageView.isHidden = true
        contentView.addSubview(crossImageView)
        contentView.addSubview(label)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(commonConstraint)
        
        contentView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
        contentView.layer.cornerRadius = 12
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(with skill: Skill, _ isEditingSkills: Bool) {
        self.skill = skill
        label.text = skill.skillName
        
        isCellForAdd = false
        removeGestureRecognizer(plusTapGestureRecognizer)
        
        if isEditingSkills {
            crossImageView.isHidden = false
            crossImageView.addGestureRecognizer(crossTapGestureRecognizer)
            NSLayoutConstraint.activate(editingSkillsConstraint)
            NSLayoutConstraint.deactivate(commonConstraint)
        } else {
            crossImageView.isHidden = true
            crossImageView.removeGestureRecognizer(crossTapGestureRecognizer)
            NSLayoutConstraint.activate(commonConstraint)
            NSLayoutConstraint.deactivate(editingSkillsConstraint)
        }
    }
    
    @objc
    private func crossImageDidTapped() {
        delegate.removeSkill(skill)
    }
    
    func configurePlus() {
        isCellForAdd = true
        label.text = "+"
        crossImageView.isHidden = true
        NSLayoutConstraint.activate(commonConstraint)
        NSLayoutConstraint.deactivate(editingSkillsConstraint)
        
        isUserInteractionEnabled = true
        addGestureRecognizer(plusTapGestureRecognizer)
    }
    
    @objc
    private func plusLabelDidTapped() {
        delegate.showAllertForAddSkill()
    }
    
}





