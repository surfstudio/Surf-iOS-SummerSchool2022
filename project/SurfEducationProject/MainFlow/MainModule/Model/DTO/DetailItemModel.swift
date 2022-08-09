//
//  DetailItemModel.swift
//  SurfEducationProject
//
//  Created by Владислав Климов on 05.08.2022.
//

import Foundation
import UIKit

struct DetailItemModel {

    // MARK: - Internal Properties

    let imageUrlInString: String
    let title: String
    var isFavorite: Bool
    let content: String
    let dateCreation: String

    // MARK: - Initialization

    internal init(imageUrlInString: String, title: String, isFavorite: Bool, content: String, dateCreation: Date) {
        self.imageUrlInString = imageUrlInString
        self.title = title
        self.isFavorite = isFavorite
        self.content = content

        let formatter = DateFormatter()
        formatter.dateFormat = "dd.mm.yyyy"

        self.dateCreation = formatter.string(from: dateCreation)
    }

    // MARK: - Internal methods

    static func createDefault() -> DetailItemModel {
        .init(
            imageUrlInString: "",
            title: "Самый милый корги",
            isFavorite: false,
            content: "Для бариста и посетителей кофеен специальные кружки для кофе — это ещё один способ проконтролировать вкус напитка и приготовить его именно так, как нравится вам. \n \nТеперь, кроме регулировки экстракции, настройки помола, времени заваривания и многого что помогает выделять нужные характеристики кофе, вы сможете выбрать и кружку для кофе в зависимости от сорта.",
            dateCreation: Date()
        )
    }

}
