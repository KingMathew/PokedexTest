//
//  PokemonDetailWireFrame.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation
import UIKit

class PokemonDetailWireFrame: PokemonDetailWireFrameProtocol {
    

    class func createPokemonDetailModule(urlDetail: String) -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "PokemonDetailView")
        if let view = navController as? PokemonDetailView {//navController.children.first solo para las primeras vistas
            let presenter: PokemonDetailPresenterProtocol & PokemonDetailInteractorOutputProtocol = PokemonDetailPresenter()
            let interactor: PokemonDetailInteractorInputProtocol & PokemonDetailRemoteDataManagerOutputProtocol = PokemonDetailInteractor()
            let localDataManager: PokemonDetailLocalDataManagerInputProtocol = PokemonDetailLocalDataManager()
            let remoteDataManager: PokemonDetailRemoteDataManagerInputProtocol = PokemonDetailRemoteDataManager()
            let wireFrame: PokemonDetailWireFrameProtocol = PokemonDetailWireFrame()
            
            view.presenter = presenter
            view.urlDetail = urlDetail
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
        return UIStoryboard(name: "Detail", bundle: Bundle.main)
    }
    
}
