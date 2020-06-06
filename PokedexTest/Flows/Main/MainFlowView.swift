//
//  MainFlowView.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class MainFlowView: BaseController, UITableViewDelegate, UITableViewDataSource {
    
    

    // MARK: Properties
    var presenter: MainFlowPresenterProtocol?

    var listData: [JSON] = []

    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var buttonNext: UIButton!
    
    @IBOutlet weak var buttonPrev: UIButton!
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        showBackButton = false
        showNav(title: "Pokemon")
        
        Webservices.requestGet(pathMethod: .PATH_POKEMON_LIST, callbackSuccess: {response in
            
            let responseJSON = JSON(response)
            
            //print("Response success: \(responseJSON["results"].arrayValue)")
            self.listData = responseJSON["results"].arrayValue
            self.tableView.reloadData()
            
            
        }, callbackFail: {error in
            
            print("Response error: \(error)")
        })
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonListCell") as! PokemonListCell
        cell.configureData(data: listData[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    @IBAction func actionPrev(_ sender: Any) {
    }
    
    
    @IBAction func actionNext(_ sender: Any) {
    }
    
}

class PokemonListCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    
    func configureData(data: JSON) {
        labelName.text = data["name"].stringValue.capitalizingFirstLetter()
    }
}

extension MainFlowView: MainFlowViewProtocol {
    // TODO: implement view output methods
}
