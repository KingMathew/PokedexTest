//
//  PokemonDetailRemoteDataManager.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation
import SwiftyJSON

class PokemonDetailRemoteDataManager: PokemonDetailRemoteDataManagerInputProtocol {

    var remoteRequestHandler: PokemonDetailRemoteDataManagerOutputProtocol?

    func getDataFromService(url: String, callback: @escaping (Any) -> ()) {
        Webservices.requestGet(url: url, callbackSuccess: { response in
            let responseJSON = JSON(response)
            callback(responseJSON)

        }, callbackFail: { error in
                print("Response error: \(error)")
                callback(error)

            })
    }

}
