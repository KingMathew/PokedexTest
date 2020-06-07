//
//  PokemonDetailProtocols.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation
import UIKit

protocol PokemonDetailViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: PokemonDetailPresenterProtocol? { get set }
}

protocol PokemonDetailWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createPokemonDetailModule(urlDetail: String) -> UIViewController
}

protocol PokemonDetailPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: PokemonDetailViewProtocol? { get set }
    var interactor: PokemonDetailInteractorInputProtocol? { get set }
    var wireFrame: PokemonDetailWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func presenterGetDataFromService(url: String, callback: @escaping (Any) -> ())
}

protocol PokemonDetailInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol PokemonDetailInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: PokemonDetailInteractorOutputProtocol? { get set }
    var localDatamanager: PokemonDetailLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: PokemonDetailRemoteDataManagerInputProtocol? { get set }
    
    func interactorGetDataFromService(url: String, callback: @escaping (Any) -> ())
}

protocol PokemonDetailDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol PokemonDetailRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: PokemonDetailRemoteDataManagerOutputProtocol? { get set }
    
    func getDataFromService(url: String, callback: @escaping (Any) -> ())
    
}

protocol PokemonDetailRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol PokemonDetailLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
