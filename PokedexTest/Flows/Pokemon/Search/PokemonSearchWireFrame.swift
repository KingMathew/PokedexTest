//
//  PokemonSearchWireFrame.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation
import UIKit

class PokemonSearchWireFrame: PokemonSearchWireFrameProtocol {

    class func createPokemonSearchModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "PokemonSearchView")
        if let view = navController as? PokemonSearchView {//navController.children.first solo para las primeras vistas
            let presenter: PokemonSearchPresenterProtocol & PokemonSearchInteractorOutputProtocol = PokemonSearchPresenter()
            let interactor: PokemonSearchInteractorInputProtocol & PokemonSearchRemoteDataManagerOutputProtocol = PokemonSearchInteractor()
            let localDataManager: PokemonSearchLocalDataManagerInputProtocol = PokemonSearchLocalDataManager()
            let remoteDataManager: PokemonSearchRemoteDataManagerInputProtocol = PokemonSearchRemoteDataManager()
            let wireFrame: PokemonSearchWireFrameProtocol = PokemonSearchWireFrame()
            
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
        return UIStoryboard(name: "Search", bundle: Bundle.main)
    }
    
    func presentDetail(urlDetail: String, from view: PokemonSearchViewProtocol) {
        let new = PokemonDetailWireFrame.createPokemonDetailModule(urlDetail: urlDetail)
        if let newView = view as? UIViewController{
            newView.navigationController?.pushViewController(new, animated: true)
        }
    }
    
    
    
}
