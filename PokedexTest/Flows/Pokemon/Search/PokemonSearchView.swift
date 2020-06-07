//
//  PokemonSearchView.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class PokemonSearchView: BaseController {

    // MARK: Properties
    var presenter: PokemonSearchPresenterProtocol?

    
    @IBOutlet weak var texFieldName: UITextField!
    
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        showNav(title: "Pokemon")

    }
    @IBAction func searchAction(_ sender: Any) {
        
        if(texFieldName.text! != ""){
            presenter?.presenterGetDataFromService(url: Globals.URL_BASE + "pokemon/", extra: texFieldName.text!, callback: {result in
                
                
                if result is JSON{
                    let responseJSON = result as! JSON
                    
                    if (responseJSON["error"].boolValue){
                        
                        let alert = UIAlertController(title: "Error", message: "Pokemon not found.", preferredStyle: UIAlertController.Style.alert)

                        alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
                        self.present(alert, animated: true, completion: nil)
                        
                        
                    }else{
                        if (responseJSON["name"].stringValue == self.texFieldName.text!){
                            
                            self.presenter?.showPokemonDetail(urlDetail: Globals.URL_BASE + "pokemon/" + self.texFieldName.text!)
                            
                        }
                    }
                    
                    
                    
                }
                
                
            })
        }
        
    }
}

extension PokemonSearchView: PokemonSearchViewProtocol {
    // TODO: implement view output methods
}
