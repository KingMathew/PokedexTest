//
//  ItemListView.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON

class ItemListView: BaseController, UITableViewDelegate, UITableViewDataSource {
    
    

    // MARK: Properties
    var presenter: ItemListPresenterProtocol?
    
    
    @IBOutlet weak var tableview: UITableView!
    var listData: [JSON] = []
    

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        showNav(title: "Items")
        
        getDataFromService(url: Globals.URL_BASE + "item/")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemsListCell") as! ItemsListCell
        cell.configureData(data: listData[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showItemDetail(urlDetail: listData[indexPath.row]["url"].stringValue)
    }
    
    func getDataFromService(url: String) {
        
        presenter?.presenterGetDataFromService(url: url, callback: { result in
            if result is JSON{
                let responseJSON = result as! JSON
                self.listData = responseJSON["results"].arrayValue
                self.tableview.reloadData()
            }
            
        })
    }
    
}


class ItemsListCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!

    func configureData(data: JSON) {
        labelName.text = data["name"].stringValue.capitalizingFirstLetter()
    }
}


extension ItemListView: ItemListViewProtocol {
    // TODO: implement view output methods
}
