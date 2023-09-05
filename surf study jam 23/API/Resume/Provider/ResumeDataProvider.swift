//
//  ResumeDataProvider.swift
//  surf study jam 23
//
//  Created by work on 01.08.2023.
//

import UIKit

protocol ResumeDataProvider {
    static var shared: ResumeDataProvider { get }
    func getSkills() -> [Skill]
    func addSkill(_ skill: Skill)
    func removeSkill(_ skill: Skill)
    
    func getBio() -> String
    func getProfile() -> Profile
}
