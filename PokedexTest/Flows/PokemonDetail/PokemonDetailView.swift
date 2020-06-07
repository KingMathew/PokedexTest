//
//  PokemonDetailView.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import AlamofireImage
import Alamofire

class PokemonDetailView: BaseController {

    // MARK: Properties
    var presenter: PokemonDetailPresenterProtocol?
    var urlDetail: String?
    

    @IBOutlet weak var mainImagePokemon: UIImageView!
    @IBOutlet weak var namePokemon: UILabel!
    
    
    @IBOutlet weak var labelType: UILabel!
    @IBOutlet weak var labelHabilities: UILabel!
    @IBOutlet weak var labelMoves: UILabel!
    
    var textType: String = ""
    var textAbilities: String = ""
    var textMoves: String = ""
    
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        showNav(title: "Pokemon")
        
        getDetailFromApi()
    }
    
    func getDetailFromApi(){
        presenter?.presenterGetDataFromService(url: self.urlDetail!, callback: {result in
            
            if result is JSON{
                let responseJSON = result as! JSON
                print(responseJSON)
                
                self.loadImage(imageURL: responseJSON["sprites"]["front_default"].stringValue)
                self.namePokemon.text = responseJSON["name"].stringValue.capitalizingFirstLetter()
                
                self.loadAbilities(data: responseJSON["abilities"].arrayValue)
                self.loadType(data: responseJSON["types"].arrayValue)
                self.loadMoves(data: responseJSON["moves"].arrayValue)

                
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
                self.mainImagePokemon.image = image
            }
        }
    }
    
    func loadAbilities(data: [JSON]){
        for (index, item) in data.enumerated(){
            let value = item["ability"]["name"].stringValue
            if (data[index] == data[0]){
                self.textAbilities = value
            }else if (data[index] == data[data.count - 1]){
                self.textAbilities = "\(self.textAbilities), \(value)."
            }else{
                self.textAbilities = "\(self.textAbilities), \(value)"
            }
        }
        self.labelHabilities.text = self.textAbilities
    }
    
    func loadType(data: [JSON]){
        for (index, item) in data.enumerated(){
            let value = item["type"]["name"].stringValue
            if (data[index] == data[0]){
                self.textType = value
            }else if (data[index] == data[data.count - 1]){
                self.textType = "\(self.textType), \(value)."
            }else{
                self.textType = "\(self.textType), \(value)"
            }
        }
        self.labelType.text = self.textType
    }
    
    func loadMoves(data: [JSON]){
        for (index, item) in data.enumerated(){
            let value = item["move"]["name"].stringValue
            if (data[index] == data[0]){
                self.textMoves = value
            }else if (data[index] == data[data.count - 1]){
                self.textMoves = "\(self.textMoves), \(value)."
            }else{
                self.textMoves = "\(self.textMoves), \(value)"
            }
        }
        self.labelMoves.text = self.textMoves
    }
    
    
}

extension PokemonDetailView: PokemonDetailViewProtocol {
    // TODO: implement view output methods
}
