# Surf study jam`23: Resume App

Приложение разработано согласно [техническому заданию](https://docs.google.com/document/d/1luRUUr6MVARiL3jRXiGmkHzlWpJFzqMTRgk2O-hMpkc/edit) во время прохождения Surf iOS Summer Study Jam'23. Приложение написано без применения storyboard. Используется архитектура MVVM.

## Основные классы
* `ResumeViewController` является основным вью контроллером. Содежит коллекцию с секциями Profile, HeaderSkill, Skill и Bio.
* `ResumeViewModel` содержит модель данных для ResumeViewController и реализует логику взаимодействия с этими данными.
* `ProfileCellView`, `HeaderSkillCellView`, `SkillCellView`, `BioCellView` являются ячейками коллекции для `ResumeViewController`.
* `ProfileViewModel` содержит модель данных для PofileCellView.
* `ResumeDataProviderImpl` соответсвует протоколу ResumeDataProvider, реализует хранение данных для ResumeViewController.


## Демо
<p align="left">
  <img src="https://github.com/masnumberone/surf-study-jam-23/assets/95964517/3ffcc23e-e8d3-468a-b5a9-0641045d97f9" width="30%"/>
</p
