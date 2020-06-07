//
//  ItemListProtocols.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation
import UIKit

protocol ItemListViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: ItemListPresenterProtocol? { get set }
}

protocol ItemListWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createItemListModule() -> UIViewController
    func presentDetail(urlDetail: String, from view: ItemListViewProtocol)

}

protocol ItemListPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: ItemListViewProtocol? { get set }
    var interactor: ItemListInteractorInputProtocol? { get set }
    var wireFrame: ItemListWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func presenterGetDataFromService(url: String, callback: @escaping (Any) -> ())
    
    func showItemDetail(urlDetail: String)


}

protocol ItemListInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol ItemListInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: ItemListInteractorOutputProtocol? { get set }
    var localDatamanager: ItemListLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ItemListRemoteDataManagerInputProtocol? { get set }
    func interactorGetDataFromService(url: String, callback: @escaping (Any) -> ())

}

protocol ItemListDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol ItemListRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ItemListRemoteDataManagerOutputProtocol? { get set }
    
    func getDataFromService(url: String, callback: @escaping (Any) -> ())
}

protocol ItemListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol ItemListLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
