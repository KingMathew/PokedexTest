//
//  ItemDetailInteractor.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation

class ItemDetailInteractor: ItemDetailInteractorInputProtocol {
    
    

    // MARK: Properties
    weak var presenter: ItemDetailInteractorOutputProtocol?
    var localDatamanager: ItemDetailLocalDataManagerInputProtocol?
    var remoteDatamanager: ItemDetailRemoteDataManagerInputProtocol?
    
    func interactorGetDataFromService(url: String, callback: @escaping (Any) -> ()) {
        remoteDatamanager?.getDataFromService(url: url, callback: callback)
    }

}

extension ItemDetailInteractor: ItemDetailRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
