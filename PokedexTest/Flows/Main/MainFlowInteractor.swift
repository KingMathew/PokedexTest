//
//  MainFlowInteractor.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation

class MainFlowInteractor: MainFlowInteractorInputProtocol {

    // MARK: Properties
    weak var presenter: MainFlowInteractorOutputProtocol?
    var localDatamanager: MainFlowLocalDataManagerInputProtocol?
    var remoteDatamanager: MainFlowRemoteDataManagerInputProtocol?

}

extension MainFlowInteractor: MainFlowRemoteDataManagerOutputProtocol {
    // TODO: Implement use case methods
}
