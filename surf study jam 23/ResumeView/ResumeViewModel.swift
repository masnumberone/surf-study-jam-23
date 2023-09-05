//
//  ResumeViewModel.swift
//  surf study jam 23
//
//  Created by work on 17.08.2023.
//

import UIKit

protocol ResumeViewModel {
    var delegate: ResumeViewControllerDelegate? { get set }
    var sections: [ResumeSections] { get }
    var skills: [Skill] { get }
    var profile: ProfileViewModel { get }
    var isEditingSkills: Bool { get set }

    func toggleEditSkills()
    func addSkill(_ skill: Skill)
    func removeSkill(_ skill: Skill)
}

enum ResumeSections {
    case profile
    case headerSkill
    case skills
    case bio
}

class ResumeViewModelImpl: ResumeViewModel {
    var sections = [ResumeSections.profile,
                    ResumeSections.headerSkill,
                    ResumeSections.skills,
                    ResumeSections.bio]

    var delegate: ResumeViewControllerDelegate?
    var skills: [Skill]
    var profile: ProfileViewModel
    var isEditingSkills = false
    var provider: ResumeDataProvider

    init() {
        provider = ResumeDataProviderImpl.shared
        self.skills = provider.getSkills()
        let profile = provider.getProfile()
        self.profile = ProfileViewModel(image: UIImage(named: profile.image)!, name: profile.name, motto: profile.motto, location: profile.location)
    }

    func toggleEditSkills() {
        isEditingSkills.toggle()
        delegate?.updateSkills()
    }

    func addSkill(_ skill: Skill) {
        provider.addSkill(skill)
        reloadAndUpdateSkills()
    }

    func removeSkill(_ skill: Skill) {
        provider.removeSkill(skill)
        reloadAndUpdateSkills()
    }

    func reloadAndUpdateSkills() {
        skills = provider.getSkills()
        delegate?.updateSkills()
    }

}
