//
//  MainScreenInteractor.swift
//  ViperDemo
//
//  Created by Dmitrii Tikhomirov on 4/30/23.
//

import UIKit

/// события которые отправляем из Interactor в Presenter
protocol MainScreenInteractorOutput: AnyObject {

    /// `Были получены данные`
    /// - Parameter text: текст
    func didReceive(text: String)
}

/// события которые отправляем от Presenter к Interactor
protocol MainScreenInteractorInput {

    /// Загрузить контент
    func getContent()
}

/// Интерактор `Экрана выбора банка получателя`
final class MainScreenInteractor: MainScreenInteractorInput {

    weak var output: MainScreenInteractorOutput?

    func getContent() {
        output?.didReceive(text: Appearance().someText)
    }
}

// MARK: - Appearance

private extension MainScreenInteractor {
    struct Appearance {
        let someText = "world"
    }
}
