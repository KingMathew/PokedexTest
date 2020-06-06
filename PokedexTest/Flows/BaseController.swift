//
//  BaseController.swift
//  Efecty-V2
//
//  Created by Arlin Ropero on 12/14/19.
//  Copyright © 2019 Proximate. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import SideMenu

class BaseController: UIViewController {

    //MARK: Properties
    var navBarView: NavBar?
    var showBackButton = true


    let viewNavBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()


    override func viewDidLoad() {
        super.viewDidLoad()

        self.setUI()

        self.view.backgroundColor = UIColor.white
        self.navigationItem.setHidesBackButton(true, animated: false)
        setupSideMenu()

    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.navigationBar.isHidden = false
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    func showNav(title: String?) {
        self.view.addSubview(viewNavBar)
        let navConstraints = [
            viewNavBar.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            viewNavBar.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            viewNavBar.topAnchor.constraint(equalTo: self.view.topAnchor),
            viewNavBar.heightAnchor.constraint(equalToConstant: 100)]
        navConstraints.forEach({ constr in constr.isActive = true })

        navBarView = NavBar()

        

        navBarView?.callbackMenu = {
            self.showMenuController()
        }
        navBarView?.callbackBack = {
            self.onClickBack()
        }

        navBarView?.textTitle = title!
        viewNavBar.addSubview(navBarView!.view)
        navBarView!.view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 100)
        
        if(!showBackButton) {
            navBarView?.buttonBack.isHidden = true
        }

    }

    func setUI() { }


    func onClickBack() {
        _ = self.navigationController?.popViewController(animated: true)
    }

    // MARK: MENU REGION

    @objc func openMenu(sender: UIButton) {
        showMenuController()
    }

    func showMenuController() {
        present(SideMenuManager.default.rightMenuNavigationController!, animated: true, completion: nil)
    }

    func setupSideMenu() {
        SideMenuManager.default.rightMenuNavigationController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "RightMenu") as? SideMenuNavigationController

        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: self.view, forMenu: .right)

        SideMenuManager.default.rightMenuNavigationController?.settings.menuWidth = UIScreen.main.bounds.width
        SideMenuManager.default.rightMenuNavigationController?.settings.presentationStyle = .menuSlideIn
    }


    func sideMenuWillAppear(menu: SideMenuNavigationController, animated: Bool) {

    }

    func sideMenuDidDisappear(menu: SideMenuNavigationController, animated: Bool) {

    }






}
