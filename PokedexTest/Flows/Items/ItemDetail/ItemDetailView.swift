//
//  ItemDetailView.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import Alamofire
import AlamofireImage

class ItemDetailView: BaseController {

    // MARK: Properties
    var presenter: ItemDetailPresenterProtocol?
    var urlDetail: String?
    
    @IBOutlet weak var mainImageItem: UIImageView!
    @IBOutlet weak var nameItem: UILabel!
    
    
    @IBOutlet weak var labelDesc: UILabel!
    @IBOutlet weak var labelCategory: UILabel!
    @IBOutlet weak var labelAttributes: UILabel!
    var textAttributes: String = ""

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        showNav(title: "Items")

        getDetailFromApi()
    }
    
    func getDetailFromApi(){
        presenter?.presenterGetDataFromService(url: self.urlDetail!, callback: {result in
            
            if result is JSON{
                let responseJSON = result as! JSON
                
                self.loadImage(imageURL: responseJSON["sprites"]["default"].stringValue)
                self.nameItem.text = responseJSON["name"].stringValue.capitalizingFirstLetter()
                
              
                self.labelDesc.text = responseJSON["flavor_text_entries"].arrayValue[0]["text"].stringValue
                
                self.labelCategory.text = responseJSON["category"]["name"].stringValue
                self.loadAttributes(data: responseJSON["attributes"].arrayValue)
                
            } else {
                let alert = UIAlertController(title: "Error", message: "An error occurred, please try later.", preferredStyle: UIAlertController.Style.alert)

                alert.addAction(UIAlertAction(title: "Aceptar", style: UIAlertAction.Style.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
            
        })
    }
    
    func loadImage(imageURL: String){
        AF.request(imageURL).responseImage { response in
            if case .success(let image) = response.result {
                self.mainImageItem.image = image
            }
        }
    }
    
    func loadAttributes(data: [JSON]){
        for (index, item) in data.enumerated(){
            let value = item["name"].stringValue
            if (data[index] == data[0]){
                self.textAttributes = value
            }else if (data[index] == data[data.count - 1]){
                self.textAttributes = "\(self.textAttributes), \(value)."
            }else{
                self.textAttributes = "\(self.textAttributes), \(value)"
            }
        }
        self.labelAttributes.text = self.textAttributes
    }
    
}

extension ItemDetailView: ItemDetailViewProtocol {
    // TODO: implement view output methods
}
