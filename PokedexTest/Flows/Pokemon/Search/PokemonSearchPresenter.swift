//
//  PokemonSearchPresenter.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation

class PokemonSearchPresenter  {
    
    // MARK: Properties
    weak var view: PokemonSearchViewProtocol?
    var interactor: PokemonSearchInteractorInputProtocol?
    var wireFrame: PokemonSearchWireFrameProtocol?
    
}

extension PokemonSearchPresenter: PokemonSearchPresenterProtocol {
    
    
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
    
    func presenterGetDataFromService(url: String, extra: String, callback: @escaping (Any) -> ()) {
        interactor?.interactorGetDataFromService(url: url, extra: extra, callback: callback)
    }
    
    func showPokemonDetail(urlDetail: String) {
        wireFrame?.presentDetail(urlDetail: urlDetail, from: view!)
    }
}

extension PokemonSearchPresenter: PokemonSearchInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
