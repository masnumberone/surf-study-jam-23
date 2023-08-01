//
//  ViewController.swift
//  surf study jam 23
//
//  Created by work on 01.08.2023.
//

import UIKit

class ResumeViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
    
    private enum ResumeSections {
        case profile
        case headerSkill
        case skills
        case bio
    }
    private let sections = [ResumeSections.profile,
                            ResumeSections.headerSkill,
                            ResumeSections.skills,
                            ResumeSections.bio]
    
    lazy private var skills = ResumeDataProviderImpl.shared.getSkills()
    internal var isEditingSkills = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Профиль"s
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.titleView?.tintColor = .red
        
        collectionView.register(ProfileCellView.self, forCellWithReuseIdentifier: ProfileCellView.identifier)
        collectionView.register(HeaderSkillCellView.self, forCellWithReuseIdentifier: HeaderSkillCellView.identifier)
        collectionView.register(SkillCellView.self, forCellWithReuseIdentifier: SkillCellView.identifier)
        collectionView.register(BioCellView.self, forCellWithReuseIdentifier: BioCellView.identifier)
        
        collectionView.alwaysBounceVertical = true
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
    }
    
    override func viewDidLayoutSubviews() {
        view.addSubview(collectionView)
        collectionView.frame = .init(x: 0,
                                     y: 0,
                                     width: view.bounds.width,
                                     height: view.bounds.height)
    }
    
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            let sectionType = self.sections[sectionNumber]
            
            switch sectionType {
            case .profile:
                return self.createProfileCardSection()
            case .headerSkill:
                return self.createHeaderSkillSection()
            case .skills:
                return self.createSkillSection()
            case .bio:
                return self.createFooterSkillSection()
            }
        }
    }
    
    private func createProfileCardSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(24))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: itemSize.widthDimension, heightDimension: itemSize.heightDimension)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 24,
            leading: 16,
            bottom: 0,
            trailing: 16
        )
        
        return section
    }
    
    private func createHeaderSkillSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(24))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: itemSize.widthDimension, heightDimension: itemSize.heightDimension)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(12)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 40,
            leading: 16,
            bottom: 0,
            trailing: 16
        )
        
        return section
    }
    
    private func createSkillSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(100), heightDimension: .absolute(44.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: itemSize.heightDimension)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(12)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 16,
            leading: 16,
            bottom: 16,
            trailing: 16
        )
        section.interGroupSpacing = 12
        
        return section
    }
    
    func createFooterSkillSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(44))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: itemSize.widthDimension, heightDimension: itemSize.heightDimension)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = .fixed(12)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(
            top: 16,
            leading: 16,
            bottom: 0,
            trailing: 16
        )
        section.interGroupSpacing = 12
        
        return section
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionType = self.sections[section]
        
        switch sectionType {
        case .profile:  return 1
        case .headerSkill:  return 1
        case .skills:       return isEditingSkills ? skills.count + 1 : skills.count
        case .bio:          return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let sectionType = self.sections[indexPath.section]
        switch sectionType {
        case .profile:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProfileCellView.identifier, for: indexPath) as! ProfileCellView
            cell.configure(with: ResumeDataProviderImpl.shared.getProfile())
            return cell
            
        case .headerSkill:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HeaderSkillCellView.identifier, for: indexPath) as! HeaderSkillCellView
            cell.delegate = self
            return cell
            
        case .skills:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SkillCellView.identifier, for: indexPath) as! SkillCellView
            cell.delegate = self
            
            guard indexPath.item < skills.count else {
                cell.configurePlus()
                return cell
            }
            
            cell.configure(with: skills[indexPath.item], isEditingSkills)
            return cell
            
        case .bio:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BioCellView.identifier, for: indexPath) as! BioCellView
            cell.configure(with: ResumeDataProviderImpl.shared.getBio())
            return cell
        }
        
    }
}


protocol ResumeViewControllerDelegate {
    func toggleEditSkills()
    var isEditingSkills: Bool { get }
    func showAllertForAddSkill()
    func needUpdateSkills()
    func removeSkill(_ skill: Skill)
}

extension ResumeViewController: ResumeViewControllerDelegate {
    func toggleEditSkills() {
        isEditingSkills.toggle()
        collectionView.reloadSections(.init(integer: 2))
    }
    
    func showAllertForAddSkill() {
        let alertController = UIAlertController(title: "Добавление навыка", message: "Введите название навыка которым вы владеете", preferredStyle: .alert)

        alertController.addTextField { textField in
            textField.placeholder = "Введите название"
        }

        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "Добавить", style: .default) { [weak self, weak alertController] _ in
            if let text = alertController?.textFields?.first?.text {
                ResumeDataProviderImpl.shared.addSkill(Skill(skillName: text))
                self!.needUpdateSkills()
            }
        }

        alertController.addAction(cancelAction)
        alertController.addAction(okAction)

        present(alertController, animated: true, completion: nil)
    }
    
    func needUpdateSkills() {
        skills = ResumeDataProviderImpl.shared.getSkills()
        collectionView.reloadSections(.init(integer: 2))
    }
    
    func removeSkill(_ skill: Skill) {
        ResumeDataProviderImpl.shared.removeSkill(skill)
        needUpdateSkills()
    }
}





