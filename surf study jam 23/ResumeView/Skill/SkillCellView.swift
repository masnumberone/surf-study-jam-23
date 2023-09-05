//
//  SkillCellView.swift
//  surf study jam 23
//
//  Created by work on 01.08.2023.
//

import UIKit

/**

 1. Можно было убрать констреинты и положить текст и кнопку (!) в стек вью. По нажатии на кнопку делать её Hidden, стек вью все нормально изменит.
 2. ИЗИ ПИЗИ ВОТ Я ДУРАК БЛИН:
 добавляем замыкание в ячейку
 в контроллере пишем логику
 выполняем замыкание при нажатии на кнопку
 (получается, хранить скилл нам не нужно - он в замыкании)
 3. Сделать анимацию при скроле как в контактах
 4. Добавить вью модел и координатор
 5. Добавить юзер дефолтс, пусть координатор подтягивает модель (скилы)

 **/

class SkillCellView: UICollectionViewCell {
    static let identifier = "SkillCellView"
    var onTapButton: (() -> Void)?
    
    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = UIColor(red: 0.192, green: 0.192, blue: 0.192, alpha: 1)
        label.font = .systemFont(ofSize: 14, weight: .regular)

        return label
    }()

    private lazy var crossImageButton: UIButton = {
        let action = UIAction { _ in
            self.onTapButton?()
        }
        let button = UIButton(configuration: .plain(), primaryAction: action)
        button.setImage(.init(named: "cross"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [label, crossImageButton])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .center

        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        crossImageButton.isHidden = true
        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),

            crossImageButton.widthAnchor.constraint(equalToConstant: 14),
            crossImageButton.heightAnchor.constraint(equalToConstant: 14)
        ])

        contentView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.96, alpha: 1)
        contentView.layer.cornerRadius = 12
        contentView.clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(with skillName: String, isEditing: Bool) {
        label.text = skillName
        setCrossImageHidden(!isEditing)
    }

    private func setCrossImageHidden(_ value: Bool = true) {
        crossImageButton.isHidden = value
    }

    func configurePlus() {
        label.text = "+"
        setCrossImageHidden()
    }
}
