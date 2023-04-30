//
//  Factory.swift
//  ViperDemo
//
//  Created by Dmitrii Tikhomirov on 4/30/23.
//

import UIKit

/// события которые отправляем из Factory в Presenter
protocol MainScreenFactoryOutput: AnyObject {

    /// Был получен готовый текст
    /// - Parameter text: готовый, сформированный `текст`
    func didReciveFull(text: String)
}

/// события которые отправляем от Presenter к Factory
protocol MainScreenFactoryInput {

    /// Создает секции для отображения
    /// - Parameter text: `вторая часть готового текста`
    func createTitle(text: String)
}

/// Фабрика элментов `Главного Экрана`
final class MainScreenFactory: MainScreenFactoryInput {

    weak var output: MainScreenFactoryOutput?

    func createTitle(text: String) {
        let fullText = "\(Appearance().title), \(text)"
        output?.didReciveFull(text: fullText)
    }
}

// MARK: - Appearance

private extension MainScreenFactory {
    struct Appearance {
        let title = "Hello"
    }
}
