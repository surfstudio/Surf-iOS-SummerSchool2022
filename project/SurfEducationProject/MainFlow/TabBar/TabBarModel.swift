//
//  TabBarModel.swift
//  SurfEducationProject
//
//  Created by Malygin Georgii on 03.08.2022.
//

import Foundation
import UIKit

enum TabBarModel {
    case main
    case favorite
    case profile

    var title: String {
        switch self {
        case .main:
            return "Главная"
        case .favorite:
            return "Избранное"
        case .profile:
            return "Профиль"
        }
    }

    var image: UIImage? {
        switch self {
        case .main:
            return UIImage(named: "mainTab")
        case .favorite:
            return UIImage(named: "favoriteTab")
        case .profile:
            return UIImage(named: "profileTab")
        }
    }

    var selectedImage: UIImage? {
        return image
    }
    
}
