//
//  BottomBar.swift
//  Efecty-V2
//
//  Created by Arlin Ropero on 12/11/19.
//  Copyright © 2019 Proximate. All rights reserved.
//

import Foundation
import UIKit

class NavBar: UIViewController {

    @IBOutlet weak var buttonMenu: UIButton!
    @IBOutlet weak var buttonBack: UIButton!
    @IBOutlet weak var labelTitle: UILabel!

    var callbackMenu: (() -> Void)?
    var callbackBack: (() -> Void)?

    var textTitle: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        labelTitle.text = textTitle
    }


    @IBAction func menuAction(_ sender: UIButton) {
        callbackMenu!()
    }
    @IBAction func backAction(_ sender: UIButton) {
        callbackBack!()
    }
}
