//
//  PictureResponseModel.swift
//  SurfEducationProject
//
//  Created by Князьков Илья on 08.08.2022.
//

import Foundation

struct PictureResponseModel: Decodable {

    let id: String
    let title: String
    let content: String
    let photoUrl: String

}
