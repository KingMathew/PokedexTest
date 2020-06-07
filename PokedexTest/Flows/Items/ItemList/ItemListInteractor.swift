//
//  ItemListInteractor.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation

class ItemListInteractor: ItemListInteractorInputProtocol {
    
    

    // MARK: Properties
    weak var presenter: ItemListInteractorOutputProtocol?
    var localDatamanager: ItemListLocalDataManagerInputProtocol?
    var remoteDatamanager: ItemListRemoteDataManagerInputProtocol?
    
    func interactorGetDataFromService(url: String, callback: @escaping (Any) -> ()) {
        remoteDatamanager?.getDataFromService(url: url, callback: callback)
    }

}

extension ItemListInteractor: ItemListRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
