//
//  Skill.swift
//  surf study jam 23
//
//  Created by work on 05.09.2023.
//

import Foundation

struct Skill: Codable {
    var id = UUID()
    let skillName: String
}

extension Array where Element == Skill {
    static let exampleSkills = [
        Skill(skillName: "UserDefaults"),
        Skill(skillName: "AutoLayout"),
        Skill(skillName: "MVVM"),
        Skill(skillName: "Coodinator"),
        Skill(skillName: "UIKit"),
        Skill(skillName: "Git"),
        Skill(skillName: "URLSession"),
        Skill(skillName: "CoreData")
    ]
}
