//
//  PokemonDetailView.swift
//  PokedexTest
//
//  Created by Proximate on 6/06/20.
//  Copyright © 2020 mateo. All rights reserved.
//

import Foundation
import UIKit

class PokemonDetailView: BaseController {

    // MARK: Properties
    var presenter: PokemonDetailPresenterProtocol?
    var urlDetail: String?

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        showNav(title: "Pokemon")
    }
}

extension PokemonDetailView: PokemonDetailViewProtocol {
    // TODO: implement view output methods
}
