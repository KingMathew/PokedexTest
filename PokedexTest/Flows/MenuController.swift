

import Foundation
import UIKit
import SwiftyJSON

class MenuController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var mainView: UIView!

    var menuData: [JSON] = []
    var appDelegate = UIApplication.shared.delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        tableView.backgroundColor = .white
        menuData.append(JSON(["id": 1, "name": "Pokemon", "image": "pokemon_icon"]))
        menuData.append(JSON(["id": 1, "name": "Movimientos", "image": "mooves_icon"]))
        menuData.append(JSON(["id": 1, "name": "Items", "image": "items_icon"]))

    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuCell
        cell.configureData(data: menuData[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }

    

    func dismissMenu() {
        self.dismiss(animated: true, completion: nil)
    }
  

}

class MenuCell: UITableViewCell {

    @IBOutlet weak var labelMenu: UILabel!
    
    @IBOutlet weak var iconImage: UIImageView!
    
    func configureData(data: JSON) {
        labelMenu.text = data["name"].stringValue
        iconImage.image = UIImage(named: data["image"].stringValue)
    }
}
