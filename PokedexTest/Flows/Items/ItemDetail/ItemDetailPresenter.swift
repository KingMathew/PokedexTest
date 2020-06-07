//
//  ItemDetailPresenter.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation

class ItemDetailPresenter  {
    
    // MARK: Properties
    weak var view: ItemDetailViewProtocol?
    var interactor: ItemDetailInteractorInputProtocol?
    var wireFrame: ItemDetailWireFrameProtocol?
    
}

extension ItemDetailPresenter: ItemDetailPresenterProtocol {
    
    
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
    
    func presenterGetDataFromService(url: String, callback: @escaping (Any) -> ()) {
        interactor?.interactorGetDataFromService(url: url, callback: callback)
    }
}

extension ItemDetailPresenter: ItemDetailInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
