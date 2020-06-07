//
//  PokemonSearchInteractor.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation

class PokemonSearchInteractor: PokemonSearchInteractorInputProtocol {
    
    

    // MARK: Properties
    weak var presenter: PokemonSearchInteractorOutputProtocol?
    var localDatamanager: PokemonSearchLocalDataManagerInputProtocol?
    var remoteDatamanager: PokemonSearchRemoteDataManagerInputProtocol?

    func interactorGetDataFromService(url: String, extra: String, callback: @escaping (Any) -> ()) {
        remoteDatamanager?.getDataFromService(url: url, extra: extra, callback: callback)
    }
    
}

extension PokemonSearchInteractor: PokemonSearchRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
