//
//  MainFlowWireFrame.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation
import UIKit

class MainFlowWireFrame: MainFlowWireFrameProtocol {

    class func createMainFlowModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "MainFlowView")
        if let view = navController as? MainFlowView {//navController.children.first solo para las primeras vistas
            let presenter: MainFlowPresenterProtocol & MainFlowInteractorOutputProtocol = MainFlowPresenter()
            let interactor: MainFlowInteractorInputProtocol & MainFlowRemoteDataManagerOutputProtocol = MainFlowInteractor()
            let localDataManager: MainFlowLocalDataManagerInputProtocol = MainFlowLocalDataManager()
            let remoteDataManager: MainFlowRemoteDataManagerInputProtocol = MainFlowRemoteDataManager()
            let wireFrame: MainFlowWireFrameProtocol = MainFlowWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.localDatamanager = localDataManager
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func presentDetail(urlDetail: String, from view: MainFlowViewProtocol) {
        let new = PokemonDetailWireFrame.createPokemonDetailModule(urlDetail: urlDetail)
        if let newView = view as? UIViewController{
            newView.navigationController?.pushViewController(new, animated: true)
        }
    }
    
}
