//
//  NetworkMethod.swift
//  SurfEducationProject
//
//  Created by Князьков Илья on 08.08.2022.
//

import Foundation

enum NetworkMethod: String {

    case get
    case post

}

extension NetworkMethod {

    var method: String {
        rawValue.uppercased()
    }

}
