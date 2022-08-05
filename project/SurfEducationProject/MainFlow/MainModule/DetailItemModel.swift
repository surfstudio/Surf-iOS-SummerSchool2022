//
//  DetailItemModel.swift
//  SurfEducationProject
//
//  Created by Владислав Климов on 05.08.2022.
//

import Foundation
import UIKit

struct DetailItemModel {
    let image: UIImage?
    let title: String
    var isFavorite: Bool
    let dateCreation: String
    let content: String

    static func createDefault() -> DetailItemModel {
        .init(image: UIImage(named: "default-image"), title: "Самый милый корги", isFavorite: false, dateCreation: "12.05.2022", content: "Для бариста и посетителей кофеен специальные кружки для кофе — это ещё один способ проконтролировать вкус напитка и приготовить его именно так, как нравится вам. \n \nТеперь, кроме регулировки экстракции, настройки помола, времени заваривания и многого что помогает выделять нужные характеристики кофе, вы сможете выбрать и кружку для кофе в зависимости от сорта.")
    }

}
