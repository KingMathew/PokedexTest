//
//  PokemonSearchRemoteDataManager.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation
import SwiftyJSON

class PokemonSearchRemoteDataManager: PokemonSearchRemoteDataManagerInputProtocol {

    var remoteRequestHandler: PokemonSearchRemoteDataManagerOutputProtocol?

    func getDataFromService(url: String, extra: String, callback: @escaping (Any) -> ()) {
        Webservices.requestGet(url: url + extra, callbackSuccess: { response in
            let responseJSON = JSON(response)
            callback(responseJSON)

        }, callbackFail: { error in

                print("Response error: \(error)")
                callback(JSON(["error": true]))

            })
    }

}
