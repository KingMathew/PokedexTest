//
//  PokemonSearchProtocols.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation
import UIKit

protocol PokemonSearchViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: PokemonSearchPresenterProtocol? { get set }
}

protocol PokemonSearchWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createPokemonSearchModule() -> UIViewController
    
    func presentDetail(urlDetail: String, from view: PokemonSearchViewProtocol)
    
}

protocol PokemonSearchPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: PokemonSearchViewProtocol? { get set }
    var interactor: PokemonSearchInteractorInputProtocol? { get set }
    var wireFrame: PokemonSearchWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func presenterGetDataFromService(url: String, extra: String, callback: @escaping (Any)->())
    func showPokemonDetail(urlDetail: String)

}

protocol PokemonSearchInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol PokemonSearchInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: PokemonSearchInteractorOutputProtocol? { get set }
    var localDatamanager: PokemonSearchLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: PokemonSearchRemoteDataManagerInputProtocol? { get set }
    func interactorGetDataFromService(url: String, extra: String, callback: @escaping (Any)->())

}

protocol PokemonSearchDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol PokemonSearchRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: PokemonSearchRemoteDataManagerOutputProtocol? { get set }
    func getDataFromService(url: String, extra: String, callback: @escaping (Any)->())

}

protocol PokemonSearchRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol PokemonSearchLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
