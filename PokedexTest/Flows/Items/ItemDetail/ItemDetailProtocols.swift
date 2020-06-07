//
//  ItemDetailProtocols.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation
import UIKit

protocol ItemDetailViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: ItemDetailPresenterProtocol? { get set }
}

protocol ItemDetailWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createItemDetailModule(urlDetail: String) -> UIViewController
}

protocol ItemDetailPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: ItemDetailViewProtocol? { get set }
    var interactor: ItemDetailInteractorInputProtocol? { get set }
    var wireFrame: ItemDetailWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func presenterGetDataFromService(url: String, callback: @escaping (Any) -> ())

}

protocol ItemDetailInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol ItemDetailInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: ItemDetailInteractorOutputProtocol? { get set }
    var localDatamanager: ItemDetailLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: ItemDetailRemoteDataManagerInputProtocol? { get set }
    func interactorGetDataFromService(url: String, callback: @escaping (Any) -> ())

}

protocol ItemDetailDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol ItemDetailRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: ItemDetailRemoteDataManagerOutputProtocol? { get set }
    
    func getDataFromService(url: String, callback: @escaping (Any) -> ())
}

protocol ItemDetailRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol ItemDetailLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
