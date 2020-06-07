//
//  ItemListPresenter.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation

class ItemListPresenter  {
    
    // MARK: Properties
    weak var view: ItemListViewProtocol?
    var interactor: ItemListInteractorInputProtocol?
    var wireFrame: ItemListWireFrameProtocol?
    
}

extension ItemListPresenter: ItemListPresenterProtocol {
    
    
    
    
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
    
    func presenterGetDataFromService(url: String, callback: @escaping (Any) -> ()) {
        interactor?.interactorGetDataFromService(url: url, callback: callback)
    }
    
    func showItemDetail(urlDetail: String) {
        wireFrame?.presentDetail(urlDetail: urlDetail, from: view!)
    }
    
    
}

extension ItemListPresenter: ItemListInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
