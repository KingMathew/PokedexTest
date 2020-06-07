//
//  ItemDetailWireFrame.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation
import UIKit

class ItemDetailWireFrame: ItemDetailWireFrameProtocol {

    class func createItemDetailModule(urlDetail: String) -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "ItemDetailView")
        if let view = navController as? ItemDetailView {//navController.children.first solo para las primeras vistas
            let presenter: ItemDetailPresenterProtocol & ItemDetailInteractorOutputProtocol = ItemDetailPresenter()
            let interactor: ItemDetailInteractorInputProtocol & ItemDetailRemoteDataManagerOutputProtocol = ItemDetailInteractor()
            let localDataManager: ItemDetailLocalDataManagerInputProtocol = ItemDetailLocalDataManager()
            let remoteDataManager: ItemDetailRemoteDataManagerInputProtocol = ItemDetailRemoteDataManager()
            let wireFrame: ItemDetailWireFrameProtocol = ItemDetailWireFrame()
            
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
        return UIStoryboard(name: "Items", bundle: Bundle.main)
    }
    
}
