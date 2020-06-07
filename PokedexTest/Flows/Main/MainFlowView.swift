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

    var urlNext: String = ""
    var urlPrev: String = ""


    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var buttonNext: UIButton!
    @IBOutlet weak var buttonPrev: UIButton!

    // MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()

        showBackButton = false
        showNav(title: "Pokemon")

        getDataFromService(url: Globals.URL_BASE, extra: "pokemon")

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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showPokemonDetail(urlDetail: listData[indexPath.row]["url"].stringValue)
    }

    func getDataFromService(url: String, extra: String? = "") {
        
        presenter?.presenterGetDataFromService(url: url, extra: extra!, callback: { result in
            if result is JSON{
                let responseJSON = result as! JSON
                self.listData = responseJSON["results"].arrayValue
                self.urlNext = responseJSON["next"].stringValue
                self.urlPrev = responseJSON["previous"].stringValue
                self.tableView.reloadData()
            } else {
                let alert = UIAlertController(title: "Error", message: "An error occurred, please try later.", preferredStyle: UIAlertController.Style.alert)

                alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
            
            
        })
    }


    @IBAction func actionPrev(_ sender: Any) {
        if(urlPrev != "") {
            getDataFromService(url: urlPrev)
        }

    }


    @IBAction func actionNext(_ sender: Any) {
        if (urlNext != "") {
            getDataFromService(url: urlNext)
        }

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
