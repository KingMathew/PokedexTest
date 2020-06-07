//
//  PokemonDetailInteractor.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation

class PokemonDetailInteractor: PokemonDetailInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: PokemonDetailInteractorOutputProtocol?
    var localDatamanager: PokemonDetailLocalDataManagerInputProtocol?
    var remoteDatamanager: PokemonDetailRemoteDataManagerInputProtocol?

}

extension PokemonDetailInteractor: PokemonDetailRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
