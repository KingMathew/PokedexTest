//
//  MainFlowPresenter.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation

class MainFlowPresenter  {
    
    // MARK: Properties
    weak var view: MainFlowViewProtocol?
    var interactor: MainFlowInteractorInputProtocol?
    var wireFrame: MainFlowWireFrameProtocol?
    
}

extension MainFlowPresenter: MainFlowPresenterProtocol {
    // TODO: implement presenter methods
    func viewDidLoad() {
    }
}

extension MainFlowPresenter: MainFlowInteractorOutputProtocol {
    // TODO: implement interactor output methods
}
