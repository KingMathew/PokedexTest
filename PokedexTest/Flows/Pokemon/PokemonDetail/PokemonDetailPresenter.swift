//
//  PokemonDetailPresenter.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation

class PokemonDetailPresenter  {
    
    // MARK: Properties
    weak var view: PokemonDetailViewProtocol?
    var interactor: PokemonDetailInteractorInputProtocol?
    var wireFrame: PokemonDetailWireFrameProtocol?
    
}

extension PokemonDetailPresenter: PokemonDetailPresenterProtocol {
        
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
    
    func presenterGetDataFromService(url: String, callback: @escaping (Any) -> ()) {
        interactor?.interactorGetDataFromService(url: url, callback: callback)
    }

}

extension PokemonDetailPresenter: PokemonDetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
