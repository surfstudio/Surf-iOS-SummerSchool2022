//
//  BaseTokenStorage.swift
//  SurfEducationProject
//
//  Created by Князьков Илья on 08.08.2022.
//

import Foundation

struct BaseTokenStorage: TokenStorage {

    func getToken() throws -> TokenContainer {
        TokenContainer(
            token: "13dafde943a580620627b934bb12a39ed589514ef42b479e82a56b15451460fc"
        )
    }

    func set(newToken: TokenContainer) throws { }

}
