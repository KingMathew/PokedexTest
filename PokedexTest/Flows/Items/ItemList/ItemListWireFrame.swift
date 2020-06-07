//
//  ItemListWireFrame.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation
import UIKit

class ItemListWireFrame: ItemListWireFrameProtocol {

    class func createItemListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "ItemListView")
        if let view = navController as? ItemListView {//navController.children.first solo para las primeras vistas
            let presenter: ItemListPresenterProtocol & ItemListInteractorOutputProtocol = ItemListPresenter()
            let interactor: ItemListInteractorInputProtocol & ItemListRemoteDataManagerOutputProtocol = ItemListInteractor()
            let localDataManager: ItemListLocalDataManagerInputProtocol = ItemListLocalDataManager()
            let remoteDataManager: ItemListRemoteDataManagerInputProtocol = ItemListRemoteDataManager()
            let wireFrame: ItemListWireFrameProtocol = ItemListWireFrame()
            
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
        return UIStoryboard(name: "Items", bundle: Bundle.main)
    }
    
    func presentDetail(urlDetail: String, from view: ItemListViewProtocol) {
        let new = ItemDetailWireFrame.createItemDetailModule(urlDetail: urlDetail)
        if let newView = view as? UIViewController{
            newView.navigationController?.pushViewController(new, animated: true)
        }
    }
}
