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
    
    private let skillsKey = "skills"
    private let defaults = UserDefaults.standard
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private var skills: [Skill] {
        get {
            guard let encodedSkills = defaults.data(forKey: skillsKey) else { return [Skill]() }
            return try! decoder.decode([Skill].self, from: encodedSkills)
        }
        set {
            if let encodedSkills = try? encoder.encode(newValue) {
                defaults.set(encodedSkills, forKey: skillsKey)
            }
        }
    }
    
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
        """
        Студент выпускного курса СПбГУАП по специальности \"Программная инженерия\". \
        Изучаю Swift и UIKit, пишу проекты для профиля GitHub и готовлюсь к собеседованиям!
        """
    }
    
    func getProfile() -> Profile {
        .init(image: "myPortrait", name: "Мухортов Максим Валентинович", motto: "Очень начинающий iOS-разработчик, опыт один годик", location: "Санкт-Петербург")
    }
    
}
