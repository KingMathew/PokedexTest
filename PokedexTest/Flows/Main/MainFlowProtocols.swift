//
//  MainFlowProtocols.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation
import UIKit

protocol MainFlowViewProtocol: class {
    // PRESENTER -> VIEW
    var presenter: MainFlowPresenterProtocol? { get set }
}

protocol MainFlowWireFrameProtocol: class {
    // PRESENTER -> WIREFRAME
    static func createMainFlowModule() -> UIViewController
    
    func presentDetail(urlDetail: String, from view: MainFlowViewProtocol)
}

protocol MainFlowPresenterProtocol: class {
    // VIEW -> PRESENTER
    var view: MainFlowViewProtocol? { get set }
    var interactor: MainFlowInteractorInputProtocol? { get set }
    var wireFrame: MainFlowWireFrameProtocol? { get set }
    
    func viewDidLoad()
    
    func showPokemonDetail(urlDetail: String)
    
    func presenterGetDataFromService(url: String, extra: String, callback: @escaping (Any)->())
}

protocol MainFlowInteractorOutputProtocol: class {
// INTERACTOR -> PRESENTER
}

protocol MainFlowInteractorInputProtocol: class {
    // PRESENTER -> INTERACTOR
    var presenter: MainFlowInteractorOutputProtocol? { get set }
    var localDatamanager: MainFlowLocalDataManagerInputProtocol? { get set }
    var remoteDatamanager: MainFlowRemoteDataManagerInputProtocol? { get set }
    func interactorGetDataFromService(url: String, extra: String, callback: @escaping (Any)->())
}

protocol MainFlowDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol MainFlowRemoteDataManagerInputProtocol: class {
    // INTERACTOR -> REMOTEDATAMANAGER
    var remoteRequestHandler: MainFlowRemoteDataManagerOutputProtocol? { get set }
    
    func getDataFromService(url: String, extra: String, callback: @escaping (Any)->())
    
}

protocol MainFlowRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
}

protocol MainFlowLocalDataManagerInputProtocol: class {
    // INTERACTOR -> LOCALDATAMANAGER
}
