//
//  ResumeDataProviderImpl.swift
//  surf study jam 23
//
//  Created by work on 01.08.2023.
//

import UIKit

class ResumeDataProviderImpl: ResumeDataProvider {
    static var shared: ResumeDataProvider = ResumeDataProviderImpl()
    private init() { }
    
    private var skills: [Skill] = [.init(skillName: "User Defaults")]
    
    func getSkills() -> [Skill] {
        skills
    }
    
    func addSkill(_ skill: Skill) {
        skills.append(skill)
    }
    
    func removeSkill(_ skill: Skill) {
        skills.removeAll { $0.id == skill.id }
    }
    
    func getBio() -> String {
        "Experienced software engineer skilled in developing scalable and maintainable systems"
    }
    
    func getProfile() -> Profile {
        .init(image: UIImage(named: "myPortrait")!, name: "Мухортов Максим Валентинович", motto: "Очень начинающий iOS-разработчик, опыт один годик", location: "Санкт-Петербург")
    }
    
}
